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
import UIKit

class TaskListViewController: UIViewController {
    
    let taskCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(TaskViewCell.self, forCellWithReuseIdentifier: TaskViewCell.swiftIdentifier)
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    let newTaskButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let dataSource = RxCollectionViewSectionedAnimatedDataSource<TaskSection>(
        configureCell: { ds, cv, ip, item in
            guard let cell = cv.dequeueReusableCell(withReuseIdentifier: TaskViewCell.swiftIdentifier, for: ip) as? TaskViewCell else {
                return UICollectionViewCell()
            }
            cell.reactor = TaskViewCellReactor(item)
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
        
        taskCollectionView.do {
            view.addSubview($0)
            $0.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
        newTaskButton.do {
            view.addSubview($0)
            $0.addTarget(self, action: #selector(showEditViewController), for: .touchUpInside)
            $0.setImage(Asset.icAdd.image.withRenderingMode(.alwaysTemplate), for: .normal)
            $0.snp.actionRightBottom(self)
            $0.apply(ViewStyle.floatingAction())
        }
    }
    @objc
    func showEditViewController() {
        self.show(TaskEditViewController(), sender: nil)
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
        return CGSize(width: view.frame.width, height: TaskViewCell.Metric.height)
    }
}
