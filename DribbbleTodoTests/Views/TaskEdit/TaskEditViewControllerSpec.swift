//
//  TaskListViewControllerSpec.swift
//  DribbbleTodoTests
//
//  Created by tskim on 08/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//
import Nimble
import Quick
import UIKit
import Swinject
import RxCocoa
import RxTest
@testable import DribbbleTodo
class TaskEditViewControllerSpec: QuickSpec {
    override func spec() {
        var viewController: TaskEditViewController!
        var reactor: TaskEditReactor!
        var testDispatcherSchedulers: RxTestDispatcherSchedulers!
        
        beforeEach {
            testDispatcherSchedulers = RxTestDispatcherSchedulers()
            reactor = TaskEditReactor(edit: EditingTask())
            viewController = TaskEditViewController(reactor: reactor, scheduler: testDispatcherSchedulers, taskCompletion: nil)
        }
        
        describe("A TaskEditViewController") {
            context("when saves a task") {
                beforeEach {
                    reactor.stub.isEnabled = true
                }
                it("return taskCompletion saved a task") {
                    var actualTask: EditingTask? = nil
                    let expectTask = EditingTask(title: "title")
                    reactor.stub.state.value.editingTask = expectTask
                    viewController.taskCompletion = {
                        actualTask = $0
                    }
                    viewController.doneButton.doAction()
                    expect(actualTask) == expectTask
                }
            }
        }
    }
}
extension UIBarButtonItem {
    func doAction() {
        if let action = self.action {
            UIApplication.shared.sendAction(action, to: self.target, from: nil, for: nil)
        }
    }
}
