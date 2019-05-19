//
//  Task+Random.swift
//  DribbbleTodoTests
//
//  Created by tskim on 05/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
@testable import DribbbleTodo

extension Task {
    class func random() -> Task {
        return Task().then {
            $0.title = randomText(length: 5)
        }
    }
}
