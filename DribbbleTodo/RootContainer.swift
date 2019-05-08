//
//  RootContainer.swift
//  DribbbleTodo
//
//  Created by tskim on 05/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import RealmSwift
import Swinject

let rootContainer: Container = {
    let container = Container()
    container.register(TaskServiceType.self, factory: { _, realm in
        return TaskService(realm)
    })
    container.register(RxDispatcherSchedulers.self, factory: { _ in
        return RxDispatcherSchedulers()
    })
    return container
}()
