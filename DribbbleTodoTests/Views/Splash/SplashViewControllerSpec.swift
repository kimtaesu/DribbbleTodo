//
//  SplashViewControllerSpec.swift
//  DribbbleTodoTests
//
//  Created by tskim on 02/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import RxSwift
import RxExpect
import RxTest
import Nimble
import Quick
import Cuckoo
@testable import DribbbleTodo

class SplashViewControllerSpec: QuickSpec {
    override func spec() {
        var reactor: SplashReactor!
        var userService: UserServiceType!
        var viewController: SplashViewController!

        describe("a view") {
            context("when did appear") {
                it("sends a `.checkIfAuthenticated` action to the reactor") {
                    userService = StubUserService()
                    reactor = SplashReactor(userService)
                    reactor.stub.isEnabled = true

                    viewController = SplashViewController(SplashViewController.Dependency(
                        reactor: reactor,
                        presentLogin: { },
                        presnetMain: { }
                        )
                    )
                    _ = viewController.view
                    viewController.viewDidAppear(false)
                    expect(reactor.stub.actions.last) == .checkIfAuthenticated
                }
            }
        }
        describe("a navigation") {
            var isExecuted: (presentLoginScreen: Bool, presentMainScreen: Bool)!

            beforeEach {
                isExecuted = (false, false)
                reactor = SplashReactor(StubUserService())
                reactor.stub.isEnabled = true
                viewController = SplashViewController(
                    SplashViewController.Dependency(
                        reactor: reactor,
                        presentLogin: { isExecuted.presentLoginScreen = true },
                        presnetMain: { isExecuted.presentMainScreen = true }
                    )
                )
                _ = viewController.view
            }
            context("when succeeds to authenticate") {
                beforeEach {
                    reactor.stub.state.value.authenticated = true
                }
                it("doesn't present login screen") {
                    expect(isExecuted.presentLoginScreen) == false
                }
                it("presents main screen") {
                    expect(isExecuted.presentMainScreen) == true
                }
            }

            context("when fails to authenticate") {
                beforeEach {
                    reactor.stub.state.value.authenticated = false
                }
                it("presents login screen") {
                    expect(isExecuted.presentLoginScreen) == true
                }
                it("doesn't present main screen") {
                    expect(isExecuted.presentMainScreen) == false
                }
            }
        }
    }
}


