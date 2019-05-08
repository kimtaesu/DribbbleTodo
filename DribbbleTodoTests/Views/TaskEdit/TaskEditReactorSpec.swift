//
//  TaskEditReactor.swift
//  DribbbleTodoTests
//
//  Created by tskim on 07/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import RxSwift
import RxExpect
import RxTest
import Nimble
import Cuckoo
import Quick
@testable import DribbbleTodo

class TaskEditReactorSpec: QuickSpec {
    override func spec() {
        var reactor: TaskEditReactor!
        var taskService: MockTaskServiceType!
        beforeEach {
            taskService = MockTaskServiceType().mockAddTasks()
            
            reactor = TaskEditReactor(taskService)
        }
        describe("A TaskEditReactorSpec") {
            it("save tasks") {
                let rxRxpect = RxExpect()
                rxRxpect.retain(reactor)
                rxRxpect.input(reactor.action, [
                    next(100, .setTitle("a")),
                    next(100, .setTitle("abc")),
                    next(200, .setDesc("zxc")),
                    next(300, .clicksDone),
                    ])
                
                rxRxpect.assert(reactor.state.map { $0.title }) { events in
                    XCTAssertEqual(events, [
                        next(0, ""),
                        next(100, "a"),
                        next(100, "abc"),
                        next(200, "abc"),
                        next(300, "abc"),
                        ])
                }
                rxRxpect.assert(reactor.state.map { $0.desc }) { events in
                    XCTAssertEqual(events, [
                        next(0, ""),
                        next(100, ""),
                        next(100, ""),
                        next(200, "zxc"),
                        next(300, "zxc"),
                        ])
                }
                let expectTask: Task? = Task().then {
                    $0.title = "abc"
                    $0.desc = "zxc"
                }
                rxRxpect.assert(reactor.state.map { $0.doneTask }) { events in
                    XCTAssertEqual(events, [
                        next(0, nil),
                        next(100, nil),
                        next(100, nil),
                        next(200, nil),
                        next(300, expectTask)
                        ])
                }
            }
            it("empty contents") {
                let rxRxpect = RxExpect()
                rxRxpect.retain(reactor)
                rxRxpect.input(reactor.action, [
                    next(100, .clicksDone),
                    ])
                
                let okAction: (UIAlertAction) -> Void = { [weak reactor] _ in
                    reactor?.action.onNext(.saveTasks)
                }
                let expectAlert = UIAlertComponent(
                    title: L10n.uiAlertNoticeTitle,
                    message: L10n.uiAlertEmptyContents,
                    actions: [
                        UIAlertActionComponent(title: L10n.uiAlertCancelTitle, style: .cancel),
                        UIAlertActionComponent(title: L10n.uiAlertOkTitle, action: okAction)
                    ]
                )
                rxRxpect.assert(reactor.state.map { $0.alertView }) { events in
                    XCTAssertEqual(events, [
                        next(0, nil),
                        next(100, Optional(expectAlert))
                        ])
                }
                // when clicks an ok button
                okAction(UIAlertAction())
                rxRxpect.assert(reactor.state.map { $0.doneTask }) { events in
                    XCTAssertEqual(events[0], next(0, Task()))
                }
            }
        }
    }
}
