//
//  TaskEditViewController.swift
//  DribbbleTodo
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import ReactorKit
import UIKit

class TaskEditViewController: UIViewController {

    let titleTextField = UITextField()
    let descView = DescriptionView()
    let doneButton = UIButton()

    struct Metric {
        static let descHeight: CGFloat = 100
    }

    init() {
        defer { self.reactor = taskEditContainer.resolve(TaskEditReactor.self) }
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
                $0.leading.equalToSuperview()
                $0.centerX.equalToSuperview()
                $0.top.equalToSuperview()
            }
        }
        descView.do {
            view.addSubview($0)
            $0.snp.makeConstraints {
                $0.leading.equalToSuperview()
                $0.centerX.equalToSuperview()
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
        doneButton.rx.tap
            .map { Reactor.Action.clicksDone }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        reactor.state.map { $0.emptyContentAlertView }
            .filterNil()
            .bind(to: self.rx.presentUIAlert)
            .disposed(by: disposeBag)

    }
}
