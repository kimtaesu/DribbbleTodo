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
        beforeEach {
            reactor = TaskEditReactor(edit: EditingTask())
        }
        describe("A TaskEditReactorSpec") {
            it("save tasks") {
                let rxRxpect = RxExpect()
                rxRxpect.retain(reactor)
                rxRxpect.input(reactor.action, [
                    next(100, .setTitle("a")),
                    next(100, .setTitle("abc")),
                    next(300, .clicksDone),
                    ])
                
                rxRxpect.assert(reactor.state.map { $0.editingTask.title }) { events in
                    XCTAssertEqual(events, [
                        next(0, ""),
                        next(100, "a"),
                        next(100, "abc"),
                        next(300, "abc"),
                        ])
                }
                let expectTask: EditingTask? = EditingTask(title: "abc")
                rxRxpect.assert(reactor.state.map { $0.savedEditingTask }) { events in
                    XCTAssertEqual(events, [
                        next(0, nil),
                        next(100, nil),
                        next(100, nil),
                        next(300, expectTask)
                        ])
                }
            }
            it("shown empty contents") {
                let rxRxpect = RxExpect()
                rxRxpect.retain(reactor)
                rxRxpect.input(reactor.action, [
                    next(100, .clicksDone),
                    ])
                
                let expectAlert = UIAlertComponent(
                    title: L10n.uiAlertNoticeTitle,
                    message: L10n.uiAlertEmptyContents,
                    actions: [
                        UIAlertActionComponent(title: L10n.uiAlertOkTitle)
                    ]
                )
                rxRxpect.assert(reactor.state.map { $0.alertView }) { events in
                    XCTAssertEqual(events, [
                        next(0, nil),
                        next(100, Optional(expectAlert))
                        ])
                }
            }
        }
    }
}
