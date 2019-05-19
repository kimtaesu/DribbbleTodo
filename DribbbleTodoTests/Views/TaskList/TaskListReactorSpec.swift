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
            taskService = MockTaskServiceType().mockSample().mockAddTasks()
            reactor = TaskListReactor(taskService)
        }
        describe("A TaskListReactor") {
            it("fetchTasks") {
                let rxRxpect = RxExpect()
                rxRxpect.retain(reactor)
                rxRxpect.input(reactor.action, [
                    next(100, .fetchTasks)
                    ])

                rxRxpect.assert(reactor.state.map { $0.sections.count }) { events in
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
            xit("added a task") {
                let addedTask = EditingTask.random()
                let rxRxpect = RxExpect()
                rxRxpect.retain(reactor)
                rxRxpect.input(reactor.action, [
                    next(0, .fetchTasks),
                    next(100, .updateEditingTask(addedTask))
                    ])

                rxRxpect.assert(reactor.state.map { $0.sections.flatMap { $0.items } }) { events in
//                     ("[next(0) @ 0, next(0) @ 0, next(1) @ 0, next(1) @ 0, next(1) @ 100]
                    let actual100ms = events.filter {
                        $0.time == 100
                    }
                    var expects: [TaskViewModel] = []
                    // Inserted at first
                    expects.append(addedTask.task.viewModel)
                    expects.append(contentsOf: MockTaskServiceType.sampleTasks.map { $0.viewModel })
                    
                    XCTAssertEqual(actual100ms, [
                        next(100, expects)
                        ])
                }
                rxRxpect.assert(reactor.state.map { $0.refreshing }) { events in
                    let actual100ms = events.filter {
                        $0.time == 100
                    }
                    XCTAssertEqual(actual100ms, [
                        next(100, false)
                        ])
                }
            }
        }
    }
}


