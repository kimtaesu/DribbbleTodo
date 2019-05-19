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
        
        // becaesu the tasks have sort options for (key: createdAt asc: false) add an date
        let expectTasks = [
            Task.random(Date().addingTimeInterval(100)),
            Task.random()
        ]
        
        var service: TaskServiceType!
        beforeEach {
            let realm = try! Realm()
            service = TaskService(realm)
        }
        
        xdescribe("A TaskService") {
            it("fetch tasks before adding a tasks") {
                service.updateIfEmptyAdd(task: expectTasks[0])
                service.updateIfEmptyAdd(task: expectTasks[1])
                
                service.getTasks().subscribe(onNext: { tasks in
                    expect(tasks) == expectTasks
                })
                
            }
        }
        
    }
}

