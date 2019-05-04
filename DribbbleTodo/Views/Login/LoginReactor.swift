//
//  LoginReactor.swift
//  DribbbleTodo
//
//  Created by tskim on 02/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import FirebaseAuth
import Foundation
import ReactorKit
import RxSwift

class LoginReactor: Reactor {
    let initialState: State = State()
    let userService: UserServiceType

    init(_ userService: UserServiceType) {
        self.userService = userService
    }

    enum Action {
        case setGoogleSignIn(Me?, Error?)
    }

    struct State {
        var user: Me?
        var uiAlertView: UIAlertComponent?
    }

    enum Mutation {
        case setGoogleSignIn(Me?, Error?)
    }
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .setGoogleSignIn(user, error):
            return .just(Mutation.setGoogleSignIn(user, error))
        }
    }
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case let .setGoogleSignIn(user, error):
            if let error = error {
                newState.uiAlertView = UIAlertComponent(title: L10n.uiAlertWarningTitle, message: L10n.errorGoogleSignIn(error.localizedDescription))
            } else {
                newState.user = user
            }
        }
        return newState
    }
}
