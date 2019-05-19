//
//  Task+Equal.swift
//  DribbbleTodoTests
//
//  Created by tskim on 08/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
@testable import DribbbleTodo
extension Task {
    override open func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? Task else {
            return false
        }
        return self.title == object.title && self.isDone == object.isDone
    }
}
