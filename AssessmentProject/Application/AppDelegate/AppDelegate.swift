//
//  AppDelegate.swift
//  AssessmentProject
//
//  Created by Ku Ku Zan on 10/19/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /// InitViewController
        let initialViewController = AuthenticationController()
        let navigationController = UINavigationController(rootViewController: initialViewController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

}

