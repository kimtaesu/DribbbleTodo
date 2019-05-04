//
//  StubAppDelegate.swift
//  DribbbleTodoTests
//
//  Created by tskim on 02/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//
import UIKit
import FirebaseCore
final class StubAppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
        ) -> Bool {
        let filePath = Bundle.main.path(forResource: "GoogleService-Info-Test", ofType: "plist")
        let options = FirebaseOptions(contentsOfFile: filePath!)
        FirebaseApp.configure(options: options!)
        return true
    }
}


