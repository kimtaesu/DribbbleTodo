//
//  TaskListReactorSpec.swift
//  DribbbleTodoTests
//
//  Created by tskim on 05/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import RxSwift
import RxExpect
import RxTest
import Nimble
import XCTest
import Quick
@testable import DribbbleTodo

class TaskListReactorSpec: QuickSpec {
    override func spec() {
        var reactor: TaskListReactor!
        var taskService: MockTaskServiceType!
        beforeEach {
            taskService = MockTaskServiceType().mockSample()
            reactor = TaskListReactor(taskService)
        }
        describe("A TaskListReactor") {
            it("fetchTasks") {
                let rxRxpect = RxExpect()
                rxRxpect.retain(reactor)
                rxRxpect.input(reactor.action, [
                    next(100, .fetchTasks)
                    ])
                
                rxRxpect.assert(reactor.state.map { $0.items.count }) { events in
                    XCTAssertEqual(events.last, next(100, 1))
                }
                rxRxpect.assert(reactor.state.map { $0.refreshing }) { events in
                    XCTAssertEqual(events, [
                        next(0, false),
                        next(100, true),
                        next(100, true),
                        next(100, false)
                        ])
                }
            }
        }
    }
}


