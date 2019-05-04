//
//  DayOfWeek.swift
//  DribbbleTodo
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation

enum DayOfWeek: Int, CaseIterable {
    case sunday = 1
    case monday = 2
    case thursday = 3
    case tuesday = 4
    case wednesday = 5
    case friday = 6
    case saturday = 7
    
    var description : String {
        get {
            switch self {
            case .sunday:
                return "Sun"
            case .monday:
                return "Mon"
            case .thursday:
                return "Thurs"
            case .wednesday:
                return "Wednes"
            case .tuesday:
                return "Tues"
            case .friday:
                return "Fri"
            case .saturday:
                return "Satur"
            }
        }
    }
}
