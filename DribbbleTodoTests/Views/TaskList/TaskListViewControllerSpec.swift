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
        var viewController: TaskListViewController!
        var reactor: TaskListReactor!
        var taskService: MockTaskServiceType!
        
        beforeEach {
            taskService = MockTaskServiceType().mockSample()
            reactor = TaskListReactor(taskService)
            viewController = TaskListViewController(reactor: reactor)
        }
        describe("A TaskListViewController") {
            context("viewDidLoad") {
                beforeEach {
                    _ = viewController.view
                }
                it("present a cell") {
                    viewController.taskCollectionView.layoutIfNeeded()
                    let cell: TaskViewCell = viewController.taskCollectionView.cell(IndexPath(row: 0, section: 0))
                    expect(cell.titleView.text) == MockTaskServiceType.sampleTasks.first!.title
                }
            }
        }
    }
}
