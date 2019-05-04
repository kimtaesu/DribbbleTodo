//
//  SplashReactor.swift
//  DribbbleTodo
//
//  Created by tskim on 02/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//
import ReactorKit
import RxSwift

class SplashReactor: Reactor {
    
    let initialState: State
    let userService: UserServiceType
    
    init(_ userService: UserServiceType) {
        initialState = State()
        self.userService = userService
    }
    
    struct State {
        var authenticated: Bool?
    }
    enum Action {
        case checkIfAuthenticated
    }
    enum Mutation {
        case setAuthenticated(Bool)
    }
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .checkIfAuthenticated:
            return .just(.setAuthenticated(userService.isLogin()))
        }
    }
    func reduce(state: State, mutation: Mutation) -> SplashReactor.State {
        var newState = state
        switch mutation {
        case .setAuthenticated(let authenticated):
            newState.authenticated = authenticated
        }
        return newState
    }
}
