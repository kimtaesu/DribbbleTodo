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
        return [
            Task.random(),
            Task.random(),
            Task.random()
        ]
    }()
    
    func mockSample(mock: MockTaskServiceType? = nil) -> MockTaskServiceType {
        let mock = mock ?? self
        stub(mock) { mock in
            when(mock.fetchTasks()).then {
                return Observable.just(MockTaskServiceType.sampleTasks)
            }
        }
        return mock
    }
    
    func mockAddTasks(mock: MockTaskServiceType? = nil) -> MockTaskServiceType {
        let mock = mock ?? self
        stub(mock, block: { mock in
            mock.addTasks(any()).then({ tasks in
                Observable.just(Result.success(tasks))
            })
        })
        return mock
    }
}
