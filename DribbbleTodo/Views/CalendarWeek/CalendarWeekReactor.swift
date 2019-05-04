//
//  CalendarWeekReactor.swift
//  DribbbleTodo
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift

class CalendarWeekReactor: Reactor {
    let initialState: State = State()
    
    init() {
    }
    
    enum Action {
        case fetchDays
    }
    struct State {
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
