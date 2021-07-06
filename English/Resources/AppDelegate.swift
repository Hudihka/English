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
        
//        if DefaultsUtils.isUserSeeTrening == false {
//            //логаут нужен тк с преведущей установки юзер мог остаться
//            do {
//                FirebaseData.shared.profile = nil
//                try Auth.auth().signOut()
//            } catch let signOutError as NSError {
//                print ("Error signing out: %@", signOutError)
//            }
//
//            self.window?.rootViewController = TraningFirstViewController.route()
//        } else
        
        
        if FirebaseAutorization.shared.idUser == nil {
            login()
        } else {
            autorizationVC()
        }
        
        return true
    }
    
    private func login(){
        let NVC = MenuViewController.route()
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

