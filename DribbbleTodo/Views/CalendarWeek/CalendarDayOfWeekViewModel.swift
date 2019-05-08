//
//  TaskDayViewModel.swift
//  DribbbleTodo
//
//  Created by tskim on 08/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import RxDataSources

struct CalendarDayOfWeekViewModel: Equatable {
    let date: Date
}

extension CalendarDayOfWeekViewModel: IdentifiableType {
    var identity: Date {
        return date
    }
}
