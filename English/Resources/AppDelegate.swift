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
            loadProfile()
        } else {
            autorizationVC()
        }

        
        
        return true
    }
    
    private func loadProfile(){
        let VC = DI.loadProfileViewController()
        self.window?.rootViewController = VC
    }
    
    private func autorizationVC(){
        let VC = DI.autorisationViewController()
        self.window?.rootViewController = VC
    }


    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication){}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    //MARK: - ORIENTATION

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {

        if let rootViewController = self.topViewControllerWithRootViewController(rootViewController: window?.rootViewController) {
            if (rootViewController.responds(to: Selector(("canRotate")))), SplitViewController.activeSplitVC {
                return .allButUpsideDown
            }
        }

        return .portrait
    }

    private func topViewControllerWithRootViewController(rootViewController: UIViewController!) -> UIViewController? {
        if (rootViewController == nil) { return nil }

        if (rootViewController.isKind(of: UITabBarController.self)) {
            return topViewControllerWithRootViewController(rootViewController: (rootViewController as! UITabBarController).selectedViewController)
        } else if (rootViewController.isKind(of: UINavigationController.self)) {
            return topViewControllerWithRootViewController(rootViewController: (rootViewController as! UINavigationController).visibleViewController)
        } else if (rootViewController.presentedViewController != nil) {
            return topViewControllerWithRootViewController(rootViewController: rootViewController.presentedViewController)
        }
        return rootViewController
    }
}

