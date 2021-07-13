//
//  AutorisationRouter.swift
//  English
//
//  Created by Константин Ирошников on 13.07.2021.
//

import Foundation

class AutorisationRouter: RouterProtocol{
    var callBack: (() -> ())? = nil
    
    var callBackParametrs: ((Any) -> ())? = nil
    
    func present() {}
    
    func push() {}
    
    func windowChange() {
        let VC = DI.menuViewController()
        UIWindow.transitionRoot(to: VC)
    }
}
