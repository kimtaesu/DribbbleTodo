//
//  TaskServiceSpec.swift
//  DribbbleTodoTests
//
//  Created by tskim on 05/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Nimble
import Quick
import RealmSwift
import RxTest
@testable import DribbbleTodo

class TaskServiceSpec: QuickSpec {
    override func spec() {
        
        describe("A TaskService") {
            var service: TaskServiceType!
            
            beforeEach {
                let realm = try! Realm()
                service = TaskService(realm)
            }
            it("fetch a tasks before adding a tasks") {
                let tasks = [
                    Task.random(),
                    Task.random()
                ]
                service.addTasks(tasks)
                
                let actual = try! service.fetchTasks().toBlocking().last()
                expect(actual) == tasks
            }
        }
    }
}

