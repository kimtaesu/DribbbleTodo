//
//  TaskListContainer.swift
//  DribbbleTodo
//
//  Created by tskim on 08/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import RealmSwift
import Swinject

let taskListContainer: Container = {
    let container = Container(parent: rootContainer)
    // swiftlint:disable force_try
    let realm = try! Realm()
    let taskService = rootContainer.resolve(TaskServiceType.self, argument: realm)!
    container.register(TaskListReactor.self, factory: { _ in TaskListReactor(taskService) }).inObjectScope(.transient)
    return container
}()
