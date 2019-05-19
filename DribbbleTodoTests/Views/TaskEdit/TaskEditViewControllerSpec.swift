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
        var taskService: MockTaskServiceType!
        var testDispatcherSchedulers: RxTestDispatcherSchedulers!
        
        beforeEach {
            testDispatcherSchedulers = RxTestDispatcherSchedulers()
            taskService = MockTaskServiceType().mockSample().mockAddTasks()
            reactor = TaskEditReactor(taskService)
            viewController = TaskEditViewController(reactor: reactor, schedulers: testDispatcherSchedulers, taskCompletion: nil)
        }
        
        describe("A TaskEditViewController") {
            context("viewDidLoad") {
                beforeEach {
                    _ = viewController.view
                }
                it("binding a titleTextField") {
                    viewController.titleTextField.text = "test"
                    viewController.titleTextField.sendActions(for: .allEditingEvents)
                    (testDispatcherSchedulers.main as! TestScheduler).advanceTo(500)
                    expect(reactor.currentState.title) == "test"
                }
                context("when saves a task") {
                    beforeEach {
                        reactor.stub.isEnabled = true
                    }
                    it("return taskCompletion saved a task") {
                        var actualTask: Task? = nil
                        let expectTask = Task().then {
                            $0.title = "title"
                        }
                        reactor.stub.state.value.title = expectTask.title
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
}
extension UIBarButtonItem {
    func doAction() {
        if let action = self.action {
            UIApplication.shared.sendAction(action, to: self.target, from: nil, for: nil)
        }
    }
}
