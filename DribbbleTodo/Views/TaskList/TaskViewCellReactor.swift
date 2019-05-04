//
//  TaskViewCellReactor.swift
//  DribbbleTodo
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift

class TaskViewCellReactor: Reactor {
    typealias Action = NoAction
    
    let initialState: TaskViewModel
    
    init(_ task: TaskViewModel) {
        self.initialState = task
    }
}
