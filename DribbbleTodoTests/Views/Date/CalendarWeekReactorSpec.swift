//
//  AA.swift
//  DribbbleTodoTests
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//


import RxSwift
import RxExpect
import RxTest
import Nimble
import Quick
@testable import DribbbleTodo
class CalendarWeekReactorSpec: QuickSpec {
    override func spec() {
        var reactor: CalendarWeekReactor!
        var test: RxExpect!
        
        beforeEach {
            reactor = CalendarWeekReactor()
            test = RxExpect()
            test.retain(reactor)
        }
        describe("A CalendarWeekReactor") {
            it("asd") {
                test.input(reactor.action, [
                    next(100, .fetchDays(Date()))
                    ])
                test.assert(reactor.state) { events in
                    XCTAssertEqual(events.elements.count, 2)
                }
            }
        }
    }
}


import Foundation
import ReactorKit
import RxSwift

class CalendarWeekReactor: Reactor {
    let initialState: State = State(days: [])
    
    init() {
    }
    
    enum Action {
        case fetchDays(Date)
    }
    struct State {
        var days: [Date]
    }
    enum Mutation {
    }
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .fetchDays:
            return .empty()
        }
    }
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        return newState
    }
}
