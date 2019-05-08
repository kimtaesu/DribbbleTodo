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
        
        let tasks = [
            Task.random(),
            Task.random()
        ]
        
        var service: TaskServiceType!
        beforeEach {
            let realm = try! Realm()
            service = TaskService(realm)
        }
        
        describe("A TaskService") {
            it("fetch a tasks before adding a tasks") {
                service.addTask(tasks[0])
                service.addTask(tasks[1])
                
                let actual = try! service.fetchTasks().toBlocking().last()
                expect(actual) == tasks
            }
        }
        
    }
}

