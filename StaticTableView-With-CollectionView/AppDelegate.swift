//
//  AppDelegate.swift
//  StaticTableView-With-CollectionView
//
//  Created by Mitya Kim on 9/3/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemCyan
        window?.rootViewController = ViewController()
        
        return true
    }
}

