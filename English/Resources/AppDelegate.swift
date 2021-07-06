//
//  AppDelegate.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import UIKit
import Firebase

var appDelegateShared: AppDelegate {
    return UIApplication.shared.delegate as? AppDelegate ?? AppDelegate()
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        window = UIWindow(frame: CGRect(origin: CGPoint.zero, size: UIScreen.main.bounds.size))
        
        
        if FirebaseAutorization.shared.isLoginUser {
            menu()
        } else {
            autorizationVC()
        }
        
        return true
    }
    
    private func menu(){
        let NVC = LoadProfileViewController()
        self.window?.rootViewController = NVC
    }
    
    private func autorizationVC(){
        let VC = AuthorizationViewController.route()
        self.window?.rootViewController = VC
    }


    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication){}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}
}

