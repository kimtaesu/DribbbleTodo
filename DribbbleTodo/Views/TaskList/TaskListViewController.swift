//
//  TodoListViewController.swift
//  DribbbleTodo
//
//  Created by tskim on 02/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import ReactorKit
import RxDataSources
import Swinject
import UIKit

class TaskListViewController: UIViewController {

    struct Metric {
        static let sectionInset = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
    }

    let taskCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(TaskViewCell.self, forCellWithReuseIdentifier: TaskViewCell.swiftIdentifier)
        collectionView.contentInset = Metric.sectionInset
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    let dataSource = RxCollectionViewSectionedAnimatedDataSource<TaskSection>(
        configureCell: { ds, cv, ip, item in
            guard let cell = cv.dequeueReusableCell(withReuseIdentifier: TaskViewCell.swiftIdentifier, for: ip) as? TaskViewCell else {
                return UICollectionViewCell()
            }
            cell.titleView.text = item.title
            return cell
        }
    )

    init(reactor: TaskListReactor) {
        defer { self.reactor = reactor }
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Tasks"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Asset.icAdd.image, style: .plain, target: self, action: #selector(clicksEdit))
        taskCollectionView.do {
            view.addSubview($0)
            $0.backgroundColor = .white
            $0.snp.makeConstraints {
                $0.leading.equalTo(safeAreaLeading)
                $0.trailing.equalTo(safeAreaTrailing)
                $0.top.equalTo(safeAreaTop)
                $0.bottom.equalTo(safeAreaBottom)
            }
        }
    }
    @objc
    func clicksEdit() {
        let editing = EditingTask(title: "")
        let editReactor = taskEditContainer.resolve(TaskEditReactor.self, argument: editing)!
        let scheduler = taskEditContainer.resolve(RxDispatcherSchedulersType.self)!
        self.show(TaskEditViewController(reactor: editReactor, scheduler: scheduler, taskCompletion: { [weak reactor] editing in
            logger.info("return edtingTask: \(editing)")
            reactor?.action.onNext(.updateEditingTask(editing))

        }), sender: nil)
    }
}

extension TaskListViewController: View, HasDisposeBag {
    func bind(reactor: TaskListReactor) {
        self.taskCollectionView.rx.setDelegate(self).disposed(by: disposeBag)

        self.taskCollectionView.rx.itemSelected
            .map { Reactor.Action.itemSelected($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        self.rx.viewDidLoad
            .map { Reactor.Action.fetchTasks }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        reactor.state.map { $0.selectedEditingTask }
            .filterNil()
            .bind { [weak self] editing in
                let editReactor = taskEditContainer.resolve(TaskEditReactor.self, argument: editing)!
                let scheduler = taskEditContainer.resolve(RxDispatcherSchedulersType.self)!
                let vc = TaskEditViewController(reactor: editReactor, scheduler: scheduler, taskCompletion: { [weak reactor] editing in
                    logger.info("return edtingTask: \(editing)")
                    reactor?.action.onNext(.updateEditingTask(editing))
                })
                self?.show(vc, sender: self)
            }
            .disposed(by: disposeBag)

        reactor.state.map { $0.sections }
            .filterEmpty()
            .distinctUntilChanged()
            .bind(to: taskCollectionView.rx.items(dataSource: self.dataSource))
            .disposed(by: disposeBag)
    }
}

extension TaskListViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let referenceHeight: CGFloat = TaskViewCell.Metric.height
        var referenceWidth: CGFloat = collectionView.frame.width

        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return CGSize(width: referenceWidth, height: referenceHeight)
        }
        let sectionInset = layout.sectionInset

        if #available(iOS 11.0, *) {
            referenceWidth = collectionView.safeAreaLayoutGuide.layoutFrame.width
                - sectionInset.left
                - sectionInset.right
                - collectionView.contentInset.left
                - collectionView.contentInset.right
        } else {
            referenceWidth = collectionView.frame.width
                - sectionInset.left
                - sectionInset.right
                - collectionView.contentInset.left
                - collectionView.contentInset.right
        }
        return CGSize(width: referenceWidth, height: referenceHeight)
    }
}
