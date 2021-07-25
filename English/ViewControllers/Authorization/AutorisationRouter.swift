//
//  AutorisationRouter.swift
//  English
//
//  Created by Константин Ирошников on 13.07.2021.
//

import Foundation
import UIKit

protocol AutorisationRouterProtocol: AnyObject {
    func windowChange()
}

class AutorisationRouter: AutorisationRouterProtocol{
    func windowChange() {
        let VC = DI.menuViewController()
        UIWindow.transitionRoot(to: VC)
    }
}
