//
//  SplashReactor.swift
//  DribbbleTodo
//
//  Created by tskim on 02/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift

class SplashReactor: Reactor {
    let initialState: State = State()
    
    init() {
    }
    
    enum Action {
    }
    struct State {
    }
    enum Mutation {
    }
    func mutate(action: Action) -> Observable<Mutation> {
        logger.debug("mutate action: \(action)")
        return .empty()
    }
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        return newState
    }
}
