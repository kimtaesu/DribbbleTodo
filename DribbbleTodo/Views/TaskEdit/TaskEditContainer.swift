//
//  TaskEditInject.swift
//  DribbbleTodo
//
//  Created by tskim on 05/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import RealmSwift
import Swinject

let taskEditContainer: Container = {
   let container = Container(parent: rootContainer)
    container.register(TaskEditReactor.self, factory: { _, editingTask in TaskEditReactor(edit: editingTask) }).inObjectScope(.transient)
    return container
}()
