//
//  TaskDayViewModel.swift
//  DribbbleTodo
//
//  Created by tskim on 08/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import RxDataSources

struct CarlendarDayOfWeekSection {
    let header: String
    var items: [Item]
}

extension CarlendarDayOfWeekSection: AnimatableSectionModelType {
    typealias Item = CalendarDayOfWeekViewModel
    
    var identity: String {
        return header
    }
    
    init(original: CarlendarDayOfWeekSection, items: [Item]) {
        self = original
        self.items = items
    }
}
