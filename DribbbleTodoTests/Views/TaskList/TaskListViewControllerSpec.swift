//
//  TaskListViewControllerSpec.swift
//  DribbbleTodoTests
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Nimble
import Quick
import UIKit
@testable import DribbbleTodo
class TaskListViewControllerSpec: QuickSpec {
    override func spec() {
        super.spec()
        var viewController: TaskListViewController!
        var reactor: TaskListReactor!
        
        describe("A TaskListViewController") {
            context("viewDidLoad") {
                beforeEach {
//                    reactor = TaskListReactor()
//                    viewController = TaskListViewController(reactor: reactor)
                    _ = viewController.view
                }
                it("asd") {
                    
                }
            }
            
        }
    }
}


