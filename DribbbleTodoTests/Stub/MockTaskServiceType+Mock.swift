//
//  MockTaskServiceType+Stub.swift
//  DribbbleTodoTests
//
//  Created by tskim on 05/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import Cuckoo
import RxSwift
@testable import DribbbleTodo

extension MockTaskServiceType {
    
    static let sampleTasks: [Task] = {
        let aa =  [
            Task.random(),
            Task.random(),
            Task.random()
        ]
        return aa
    }()
    func sample() -> MockTaskServiceType {
        stub(self) { mock in
            when(mock.fetchTasks()).then {
                return Observable.just(MockTaskServiceType.sampleTasks)
            }
        }
        return self
    }
}
