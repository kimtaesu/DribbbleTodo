//
//  SplashReactorSpec.swift
//  DribbbleTodoTests
//
//  Created by tskim on 02/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import RxSwift
import RxTest
import Nimble
import Quick
import Cuckoo
@testable import DribbbleTodo
class SplashReactorSpec: QuickSpec {
    override func spec() {
        super.spec()
        var reactor: SplashReactor!
        var userService: MockUserServiceType!

        beforeEach {
            userService = MockUserServiceType()
            reactor = SplashReactor(userService)
        }
        describe("reactor.action.checkIfAuthenticated") {
            context("when isLogin is false") {
                beforeEach {
                    stub(userService) { when($0.isLogin()).then { false } }
                    reactor.action.onNext(.checkIfAuthenticated)
                }
                it("authenticated to be false") {
                    expect(reactor.currentState.authenticated) == false
                }
            }
            context("when isLogin is true") {
                beforeEach {
                    stub(userService) { when($0.isLogin()).then { true } }
                    reactor.action.onNext(.checkIfAuthenticated)
                }
                it("authenticated to be true") {
                    expect(reactor.currentState.authenticated) == true
                }
            }

        }
    }
}


