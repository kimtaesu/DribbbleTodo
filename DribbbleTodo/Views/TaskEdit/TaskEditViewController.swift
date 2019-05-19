//
//  TaskEditViewController.swift
//  DribbbleTodo
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import ReactorKit
import Swinject
import UIKit

class TaskEditViewController: UIViewController {

    let titleTextField = UITextView()
    let scheduler: RxDispatcherSchedulersType
    var taskCompletion: ((Task) -> Void)?
    let doneButton = UIBarButtonItem(image: Asset.icDone.image, style: .plain, target: nil, action: nil)
    
    struct Metric {
        static let descHeight: CGFloat = 100
    }

    init(
        reactor: TaskEditReactor,
        schedulers: RxDispatcherSchedulersType,
        taskCompletion: ((Task) -> Void)? = nil
    ) {
        defer { self.reactor = reactor }
        scheduler = schedulers
        self.taskCompletion = taskCompletion
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Edit"
        navigationItem.rightBarButtonItem = doneButton
        titleTextField.do {
            $0.becomeFirstResponder()
            view.addSubview($0)
            $0.backgroundColor = ColorName.bgEditTitle
            $0.snp.makeConstraints {
                $0.leading.equalTo(safeAreaLeading).inset(20)
                $0.trailing.equalTo(safeAreaTrailing).inset(20)
                $0.top.equalTo(safeAreaTop).inset(20)
                $0.bottom.equalTo(safeAreaBottom).inset(20)
            }
        }
    }
}

extension TaskEditViewController: View, HasDisposeBag {
    func bind(reactor: TaskEditReactor) {
        doneButton.rx.tap
            .map { Reactor.Action.clicksDone }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        titleTextField.rx.text
            .throttle(0.5, scheduler: self.scheduler.main)
            .map { Reactor.Action.setTitle($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        reactor.state.map { $0.alertView }
            .filterNil()
            .bind(to: self.rx.presentUIAlert)
            .disposed(by: disposeBag)

        reactor.state.map { $0.doneTask }
            .filterNil()
            .bind { [weak self] task in
                self?.taskCompletion?(task)
                self?.hero.dismissViewController()
            }
            .disposed(by: disposeBag)
    }
}
