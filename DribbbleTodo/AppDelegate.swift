//
//  AppDelegate.swift
//  DribbbleTodo
//
//  Created by tskim on 01/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit
import GoogleSignIn

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var appDependency: AppDependency!

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        self.appDependency = self.appDependency ?? CompositionRoot.resolve()
        self.window = self.appDependency.window
        self.appDependency.configureSDKs()
        return true
    }

    func application(
        _ application: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any]
    ) -> Bool {
        return self.appDependency.openURL(url, options)
    }
}
