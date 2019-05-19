//
//  StubUserService.swift
//  DribbbleTodoTests
//
//  Created by tskim on 02/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import Cuckoo
@testable import DribbbleTodo

class StubUserService: UserServiceType {
    func isLogin() -> Bool {
        return true
    }
}
