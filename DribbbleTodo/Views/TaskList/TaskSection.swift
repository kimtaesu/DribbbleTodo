//
//  TaskViewModel.swift
//  DribbbleTodo
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import RxDataSources

struct TaskSection {
    var header: String
    var items: [Item]
}

extension TaskSection: AnimatableSectionModelType {
    typealias Item = TaskViewModel
    
    var identity: String {
        return header
    }

    init(original: TaskSection, items: [Item]) {
        self = original
        self.items = items
    }
}
