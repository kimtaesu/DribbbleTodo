//
//  Date+Day.swift
//  DribbbleTodoTests
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation

extension Date {
    static func day(dateString: String, locale: String = "ko_KR") -> Date {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: locale)
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: dateString)!
    }
}
