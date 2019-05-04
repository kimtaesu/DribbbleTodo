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
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    let dataSource = RxCollectionViewSectionedAnimatedDataSource<TaskSection>(
        configureCell: { ds, cv, ip, item in
            guard let cell = cv.dequeueReusableCell(withReuseIdentifier: TaskViewCell.swiftIdentifier, for: ip) as? TaskViewCell else {
                return UICollectionViewCell()
            }
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
    }
}

extension TaskListViewController: View, HasDisposeBag {
    func bind(reactor: TaskListReactor) {
        self.taskCollectionView.rx.setDelegate(self).disposed(by: disposeBag)

        reactor.state.map { $0.items }
            .bind(to: taskCollectionView.rx.items(dataSource: self.dataSource))
            .disposed(by: disposeBag)
    }
}

extension TaskListViewController: UICollectionViewDelegateFlowLayout {

}
