//
//  UIViewController+UIAlertViewController.swift
//  DribbbleTodo
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

extension Reactive where Base: UIViewController {
    var presentUIAlert: Binder<UIAlertComponent> {
        return Binder(self.base) { vc, uiAlert in
            let alertController = UIAlertController().then {
                $0.title = uiAlert.title
                $0.message = uiAlert.message
                uiAlert.actions.forEach{ action in
                    UIAlertAction.init(title: action.title, style: action.style, handler: action.action)
                }
            }
            vc.present(alertController, animated: true)
        }
    }
}
