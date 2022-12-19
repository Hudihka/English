//
//  AppDelegate.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import UIKit

var appDelegateShared: AppDelegate {
    return UIApplication.shared.delegate as? AppDelegate ?? AppDelegate()
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        DataProvider.shared.generateListContent()
        
        window = UIWindow(frame: CGRect(origin: CGPoint.zero, size: UIScreen.main.bounds.size))
        
        
//        window?.rootViewController = DI.
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication){}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}
}

