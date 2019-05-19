//
//  AppDelegate.swift
//  DribbbleTodo
//
//  Created by tskim on 01/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import GoogleSignIn
import RealmSwift
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var appDependency: AppDependency!

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        printEmulatorInfo()
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

extension AppDelegate {
    func printEmulatorInfo() {
        logger.debug("Library: \(FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!.path)")
        logger.debug("Realm: \(String(describing: Realm.Configuration.defaultConfiguration.fileURL))")
    }
}
