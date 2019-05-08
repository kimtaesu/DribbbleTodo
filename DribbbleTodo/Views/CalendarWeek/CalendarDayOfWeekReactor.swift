//
//  TaskDayReactor.swift
//  DribbbleTodo
//
//  Created by tskim on 08/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift

class CalendarDayOfWeekReactor: Reactor {
    let initialState: State = State()
    
    init(_ item: CalendarDayOfWeekViewModel) {
    }
    
    enum Action {
    }
    struct State {
    }
    enum Mutation {
    }
    func mutate(action: Action) -> Observable<Mutation> {
        return .empty()
    }
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        return newState
    }
}
