//
//  UIAlertA.swift
//  DribbbleTodo
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import UIKit

struct UIAlertActionComponent: Equatable {
    static func == (lhs: UIAlertActionComponent, rhs: UIAlertActionComponent) -> Bool {
        return lhs.title == rhs.title && lhs.style == rhs.style
    }

    let title: String
    let style: UIAlertAction.Style
    let action: ((UIAlertAction) -> Void)?

    public init(title: String, style: UIAlertAction.Style = UIAlertAction.Style.default, action: ((UIAlertAction) -> Void)? = nil) {
        self.title = title
        self.style = style
        self.action = action
    }
}

struct UIAlertComponent: Equatable {
    let title: String?
    let message: String?
    let style: UIAlertController.Style
    let actions: [UIAlertActionComponent]

    public init(
        title: String?,
        message: String?,
        style: UIAlertController.Style = .alert,
        actions: [UIAlertActionComponent] = [UIAlertActionComponent(title: L10n.uiAlertOkTitle, action: nil)]
    ) {
        self.title = title
        self.style = style
        self.message = message
        self.actions = actions
    }
}
