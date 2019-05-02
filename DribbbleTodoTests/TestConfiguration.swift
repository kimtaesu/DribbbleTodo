//
//  TestConfiguration.swift
//  DribbbleTodoTests
//
//  Created by tskim on 02/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Quick
import Stubber
@testable import DribbbleTodo

class TestConfiguration: QuickConfiguration {
    override class func configure(_ configuration: Configuration) {
        configuration.beforeEach {
            Stubber.clear()
            UIApplication.shared.delegate = StubAppDelegate()
        }
        
        configuration.afterEach {
            Stubber.clear()
        }
    }
}
