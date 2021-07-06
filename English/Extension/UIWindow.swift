//
//  UIWindow.swift
//  English
//
//  Created by Константин Ирошников on 06.07.2021.
//

import Foundation
import UIKit

extension UIWindow {
    
    static func transitionRoot(to: UIViewController, duration: TimeInterval = 0.4, completion: ((Bool) -> Void)? = nil){
        
        //        //.transitionCurlUp листаем сттраницы
        //        //.transitionCrossDissolve по сути пресент плавный и без анимации
        //        //.transitionFlipFromTop    переворот но не с права на лево а с верху в низ
        //        //.preferredFramesPerSecond60 вообще хрен знает
        
        let activeWindow = appDelegateShared.window!
        
        UIView.transition(with: activeWindow,
                          duration: duration,
                          options: .transitionFlipFromLeft,
                          animations: {
                            activeWindow.rootViewController = to
                          },
                          completion: completion)
        
    }


    static func getVisibleViewControllerFrom(_ vc: UIViewController?) -> UIViewController? {
        if let nc = vc as? UINavigationController {
            return UIWindow.getVisibleViewControllerFrom(nc.visibleViewController)
        } else if let tc = vc as? UITabBarController {
            return UIWindow.getVisibleViewControllerFrom(tc.selectedViewController)
        } else {
            if let pvc = vc?.presentedViewController {
                return UIWindow.getVisibleViewControllerFrom(pvc)
            } else {
                return vc
            }
        }
    }
    
}
