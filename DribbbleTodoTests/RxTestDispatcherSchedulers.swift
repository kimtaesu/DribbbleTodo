//
//  RxTestDispatcherSchedulers.swift
//  DribbbleTodoTests
//
//  Created by tskim on 08/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import RxSwift
import RxTest
@testable import DribbbleTodo

class RxTestDispatcherSchedulers: RxDispatcherSchedulersType {
    let io: SchedulerType = TestScheduler(initialClock: 0)
    let main: SchedulerType = TestScheduler(initialClock: 0)
}
