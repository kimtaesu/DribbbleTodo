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

    let titleTextField = UITextField()
    let descView = DescriptionView()
    let doneButton = UIButton()
    let scheduler: RxDispatcherSchedulersType
    var taskCompletion: ((Task) -> Void)?

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
        titleTextField.do {
            view.addSubview($0)
            $0.textColor = ColorName.taskEditTextColor
            $0.placeholder = L10n.taskTitlePlaceholder
            $0.snp.makeConstraints {
                $0.leading.equalTo(safeAreaLeading)
                $0.trailing.equalTo(safeAreaTrailing)
                $0.top.equalTo(safeAreaTop)
            }
        }
        descView.do {
            view.addSubview($0)
            $0.snp.makeConstraints {
                $0.leading.equalTo(titleTextField.snp.leading)
                $0.trailing.equalTo(titleTextField.snp.trailing)
                $0.top.equalTo(titleTextField.snp.bottom)
                $0.height.equalTo(Metric.descHeight)
            }
        }
        doneButton.do {
            view.addSubview($0)
            $0.setImage(Asset.icDone.image.withRenderingMode(.alwaysTemplate), for: .normal)
            $0.snp.actionRightBottom(self)
            $0.apply(ViewStyle.floatingAction())
        }
    }
}

extension TaskEditViewController: View, HasDisposeBag {
    func bind(reactor: TaskEditReactor) {
        descView.descTextView.rx.text
            .throttle(500, scheduler: self.scheduler.main)
            .map { Reactor.Action.setDesc($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        titleTextField.rx.text
            .throttle(500, scheduler: self.scheduler.main)
            .map { Reactor.Action.setTitle($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        doneButton.rx.tap
            .map { Reactor.Action.clicksDone }
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
