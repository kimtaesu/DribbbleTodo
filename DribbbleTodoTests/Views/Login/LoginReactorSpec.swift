//
//  LoginReactor.swift
//  DribbbleTodoTests
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import RxSwift
import RxExpect
import RxTest
import Nimble
import GoogleSignIn
import FirebaseAuth
import Quick
@testable import DribbbleTodo

class LoginReactorSpec: QuickSpec {
    override func spec() {
        var reactor: LoginReactor!
        
        beforeEach {
            reactor = LoginReactor(StubUserService())
        }
        describe("an error state") {
            context("when receives a setGoogleSignIn action") {
                it("it is TestError.firebase") {
                    reactor.action.onNext(.setGoogleSignIn(nil, TestError.firebase))
                    expect(reactor.currentState.uiAlertView) == UIAlertComponent(
                        title: L10n.uiAlertWarningTitle,
                        message: L10n.errorGoogleSignIn(TestError.firebase.localizedDescription))
                }
                it("it is me") {
                    let expectUser = Me(email: "email@email.com", displayName: "name", phoneNumber: "01011112222", photoURL: nil)
                    reactor.action.onNext(.setGoogleSignIn(expectUser, nil))
                    expect(reactor.currentState.user) == expectUser
                }
            }
        }
    }
}
