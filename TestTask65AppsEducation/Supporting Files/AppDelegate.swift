//
//  AppDelegate.swift
//  TestTask65AppsEducation
//
//  Created by Илья Андреев on 27.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = WelcomeViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}
