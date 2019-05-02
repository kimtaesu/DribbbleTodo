//
//  CompositionRoot.swift
//  DribbbleTodo
//
//  Created by tskim on 02/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//
import Crashlytics
import Fabric
import RxCocoa
import RxOptional
import SnapKit
import Swinject
import Then
import UIKit

final class CompositionRoot {

    static func resolve() -> AppDependency {
        let window = UIWindow()
        window.backgroundColor = .white
        window.makeKeyAndVisible()

        let splashDependecy = SplashViewController.Dependency(
            reactor: SplashReactor(),
            presnetMain: {
                window.rootViewController = TodoListViewController()
            }
        )

        window.rootViewController = SplashViewController(splashDependecy)
        return AppDependency(
            window: window,
            configureSDKs: configureSDKs
        )
    }

    static func configureSDKs() {
        Fabric.with([Crashlytics.self])
    }
}
