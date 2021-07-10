//
//  LoadProfileRouter.swift
//  English
//
//  Created by Константин Ирошников on 08.07.2021.
//

import Foundation
import UIKit

class LoadProfileRouter: RouterProtocol{
    var callBack: (() -> ())? = nil
    
    var callBackParametrs: ((Any) -> ())? = nil
    
    func present() {}
    
    func push() {}
    
    func windowChange() {
        let VC = DI.menuViewController()
        UIWindow.transitionRoot(to: VC)
    }
}
