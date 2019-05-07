//
//  CompositionRoot.swift
//  DribbbleTodo
//
//  Created by tskim on 02/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//
import Crashlytics
import Fabric
import Firebase
import FirebaseCore
import GoogleSignIn
import RealmSwift
import RxCocoa
import RxOptional
import SnapKit
import Swinject
import Then
import UIKit

struct AppDependency {
    typealias OpenURLHandler = (_ url: URL, _ options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool

    let window: UIWindow
    let configureSDKs: () -> Void
    let openURL: OpenURLHandler
}

final class CompositionRoot {

    static func resolve() -> AppDependency {
        let window = UIWindow()
        window.backgroundColor = .white
        window.makeKeyAndVisible()
        
        // swiftlint:disable force_try
        let realm = try! Realm()
        let taskServcie = TaskService(realm)
        let presentMainScreen = { window.rootViewController = UINavigationController(rootViewController: TaskListViewController(reactor: TaskListReactor(taskServcie))) }
//        let presentMainScreen = { window.rootViewController = TaskEditViewController() }
        
        let userService = UserService()
        let splashDependecy = SplashViewController.Dependency(
            reactor: SplashReactor(userService),
            presentLogin: {
                let loginReactor = LoginReactor(userService)
                window.rootViewController = LoginViewController(
                    loginReactor,
                    presentMainScreen: presentMainScreen
                )
            },
            presnetMain: presentMainScreen
        )

        window.rootViewController = SplashViewController(splashDependecy)
        return AppDependency(
            window: window,
            configureSDKs: configureSDKs,
            openURL: self.openURLFactory()
        )
    }

    static func configureSDKs() {
        Fabric.with([Crashlytics.self])
        let filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")
        let options = FirebaseOptions(contentsOfFile: filePath!)
        FirebaseApp.configure(options: options!)
        GIDSignIn.sharedInstance()?.clientID = PlistFiles.googleSignInClientId
    }
    
    static func openURLFactory() -> AppDependency.OpenURLHandler {
        return { url, options -> Bool in
            logger.info("openURLFactory: url[\(url)] options[\(options)]")
            return GIDSignIn.sharedInstance().handle(
                url,
                sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                annotation: [:])
        }
    }
}
