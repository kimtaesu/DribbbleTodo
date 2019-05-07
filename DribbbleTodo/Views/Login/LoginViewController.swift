//
//  LoginViewController.swift
//  DribbbleTodo
//
//  Created by tskim on 02/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import FirebaseAuth
import Foundation
import GoogleSignIn
import ReactorKit
import RxCocoa
import RxSwift
import UIKit

class LoginViewController: UIViewController {
    let googleLoginButton = GIDSignInButton()

    fileprivate let presentMainScreen: () -> Void
    
    init(
        _ reactor: LoginReactor,
        presentMainScreen: @escaping () -> Void
        ) {
        defer { self.reactor = reactor }
        self.presentMainScreen = presentMainScreen
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        googleLoginButton.do {
            view.addSubview($0)
            GIDSignIn.sharedInstance()?.uiDelegate = self
            GIDSignIn.sharedInstance()?.delegate = self
            $0.style = .iconOnly
            $0.snp.makeConstraints({ make in
                make.center.equalToSuperview()
            })
        }
    }
}

extension LoginViewController: GIDSignInUIDelegate, GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn, didSignInFor user: GIDGoogleUser, withError error: Error) {
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(
            withIDToken: authentication.idToken,
            accessToken: "asdasd"
        )
        Auth.auth().signInAndRetrieveData(with: credential) { [weak self] result, error in
            logger.info("result: [\(String(describing: result))] error: [\(String(describing: error))]")
            logger.info("currentUser: [\(String(describing: Auth.auth().currentUser))]")
            self?.reactor?.action.onNext(.setGoogleSignIn(result?.user.me, error))
        }
    }
}

extension LoginViewController: View, HasDisposeBag {
    func bind(reactor: LoginReactor) {
        reactor.state.map { $0.uiAlertView }
            .filterNil()
            .bind(to: self.rx.presentUIAlert)
            .disposed(by: disposeBag)
        reactor.state.map { $0.user }
            .filterNil()
            .bind { [weak self] _ in
                self?.presentMainScreen()
            }
            .disposed(by: disposeBag)
    }
}
