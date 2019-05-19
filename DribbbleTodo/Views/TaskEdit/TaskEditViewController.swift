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
    var taskCompletion: ((EditingTask) -> Void)?
    let doneButton = UIBarButtonItem(image: Asset.icDone.image, style: .plain, target: nil, action: nil)

    struct Metric {
        static let descHeight: CGFloat = 100
        static let docuemntMargin: CGFloat = 20
    }

    init(
        reactor: TaskEditReactor,
        scheduler: RxDispatcherSchedulersType,
        taskCompletion: ((EditingTask) -> Void)? = nil
    ) {
        defer { self.reactor = reactor }
        self.scheduler = scheduler
        self.taskCompletion = taskCompletion
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Edit"
        navigationItem.rightBarButtonItems = [doneButton]
        titleTextField.do {
            $0.becomeFirstResponder()
            view.addSubview($0)
            $0.backgroundColor = ColorName.bgEditTitle
            $0.snp.makeConstraints {
                $0.leading.equalTo(safeAreaLeading).inset(Metric.docuemntMargin)
                $0.trailing.equalTo(safeAreaTrailing).inset(Metric.docuemntMargin)
                $0.top.equalTo(safeAreaTop).inset(Metric.docuemntMargin)
                $0.bottom.equalTo(safeAreaBottom).inset(Metric.docuemntMargin)
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

        reactor.state.map { $0.savedEditingTask }
            .filterNil()
            .bind { [weak self] task in
                self?.taskCompletion?(task)
                self?.hero.dismissViewController()
            }
            .disposed(by: disposeBag)
    }
}
