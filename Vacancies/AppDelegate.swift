//
//  AppDelegate.swift
//  Vacancies
//
//  Created by Владимир Клевцов on 24.3.24..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var storage = Storage()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        

            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = LoadingScreenViewController()
            self.window?.makeKeyAndVisible()
        return true
    }
    
    
    
}

