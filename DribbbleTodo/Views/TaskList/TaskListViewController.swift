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

    let taskCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(TaskViewCell.self, forCellWithReuseIdentifier: TaskViewCell.swiftIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 0)
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
        navigationItem.title = "Tasks"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Asset.icAdd.image, style: .plain, target: self, action: #selector(showEditViewController))
        taskCollectionView.do {
            view.addSubview($0)
            $0.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
    }
    
    @objc
    func showEditViewController() {
        let reactor = taskEditContainer.resolve(TaskEditReactor.self)!
        let schedulers = taskEditContainer.resolve(RxDispatcherSchedulers.self)!
        self.show(TaskEditViewController(reactor: reactor, schedulers: schedulers, taskCompletion: { task in
            
        }), sender: nil)
    }
}

extension TaskListViewController: View, HasDisposeBag {
    func bind(reactor: TaskListReactor) {
        self.taskCollectionView.rx.setDelegate(self).disposed(by: disposeBag)

        self.rx.viewDidLoad
            .map { Reactor.Action.fetchTasks }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        reactor.state.map { $0.items }
            .filterEmpty()
            .distinctUntilChanged()
            .bind(to: taskCollectionView.rx.items(dataSource: self.dataSource))
            .disposed(by: disposeBag)
    }
}

extension TaskListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let referenceHeight: CGFloat = TaskViewCell.Metric.height
        let referenceWidth: CGFloat = view.frame.width
        return CGSize(width: referenceWidth, height: referenceHeight)
    }
}
