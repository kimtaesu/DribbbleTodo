//
//  DateDay.swift
//  DribbbleTodoTests
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation


import Nimble
import Quick
@testable import DribbbleTodo
class DateDaySpec: QuickSpec {
    override func spec() {
        var dateDay: DateDay!
        describe("A Weekly of DateDay") {
            beforeEach {
                dateDay = DateDay()
            }
            context("the date 2019-05-04") {
                let expectWeekly = [
                    Date.day(dateString: "2019-04-28"),
                    Date.day(dateString: "2019-04-29"),
                    Date.day(dateString: "2019-04-30"),
                    Date.day(dateString: "2019-05-01"),
                    Date.day(dateString: "2019-05-02"),
                    Date.day(dateString: "2019-05-03"),
                    Date.day(dateString: "2019-05-04")
                ]
                it("a current weekly") {
                    let sDate = Date.day(dateString: "2019-05-04")
                    expect(dateDay.weekdays(sDate)) == expectWeekly
                }
            }
            context("the date 2019-01-01") {
                let expectWeekly = [
                    Date.day(dateString: "2018-12-30"),
                    Date.day(dateString: "2018-12-31"),
                    Date.day(dateString: "2019-01-01"),
                    Date.day(dateString: "2019-01-02"),
                    Date.day(dateString: "2019-01-03"),
                    Date.day(dateString: "2019-01-04"),
                    Date.day(dateString: "2019-01-05")
                ]
                it("a current weekly") {
                    let sDate = Date.day(dateString: "2019-01-01")
                    expect(dateDay.weekdays(sDate)) == expectWeekly
                }
                
            }
        }
        describe("A day of week name") {
            beforeEach {
                dateDay = DateDay()
            }
            context("the date is 2019-05-04") {
                it("must be Satur") {
                    let sDate = Date.day(dateString: "2019-05-04")
                    expect (dateDay.dayOfTheWeekNames(dates: [sDate])) == ["Satur"]
                }
            }
        }
    }
}
