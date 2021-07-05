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
        return true
    }



}

