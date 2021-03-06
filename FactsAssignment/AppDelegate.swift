//
//  AppDelegate.swift
//  FactsAssignment
//
//  Created by kushal choudhari on 07/02/20.
//  Copyright © 2020 Yogesh Wagh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var appWindow: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // swiftlint:disable:previous line_length
        // Override point for customization after application launch.
        appWindow = UIWindow(frame: UIScreen.main.bounds)
        if let window = appWindow {
            // swiftlint:disable:next line_length
            window.rootViewController = UINavigationController(rootViewController: FactsViewController())
            window.makeKeyAndVisible()
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // swiftlint:disable:previous line_length
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        // swiftlint:disable:next line_length
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // swiftlint:disable:previous line_length
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running,
        //this will be called shortly after application:didFinishLaunchingWithOptions.Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        // swiftlint:disable:previous line_length
    }
}
