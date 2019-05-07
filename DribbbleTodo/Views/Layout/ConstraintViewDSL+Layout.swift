//
//  ConstraintViewDSL+Layout.swift
//  DribbbleTodo
//
//  Created by tskim on 07/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

extension ConstraintViewDSL {
    func actionRightBottom(_ vc: UIViewController) {
        self.makeConstraints({ make in
            make.bottom.equalTo(vc.safeAreaBottom).inset(20)
            make.trailing.equalTo(vc.safeAreaTrailing).inset(20)
        })
    }
}
