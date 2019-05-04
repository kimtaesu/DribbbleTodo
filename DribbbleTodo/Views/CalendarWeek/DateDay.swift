//
//  DateDay.swift
//  DribbbleTodo
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation

class DateDay {
    let calendar: Calendar
    
    init() {
        calendar = Calendar.current
    }
    
    func weekdays(_ date: Date) -> [Date]{
        let today = calendar.startOfDay(for: date)
        let dayOfWeek = calendar.component(.weekday, from: today)
        
        let weekdays = calendar.range(of: .weekday, in: .weekOfYear, for: today)!
        let days = (weekdays.lowerBound ..< weekdays.upperBound)
            .compactMap {
                calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: today)
        }
        return days
    }
    
    func dayOfTheWeekNames(dates: [Date]) -> [String] {
        let names = dates.map {
            DayOfWeek(rawValue: calendar.component(.weekday, from: $0))?.description ?? "unknwon"
        }
        return names
    }
}
