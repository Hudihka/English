//
//  NewWordRouter.swift
//  English
//
//  Created by Константин Ирошников on 26.07.2021.
//

import Foundation
import UIKit

protocol NewWordRouterProtocol: AnyObject {
    func popViewController()
    init(navigationVC: BaseNavigationController)
}

class NewWordRouter: NewWordRouterProtocol{
    private var navigationVC: BaseNavigationController!

    required init(navigationVC: BaseNavigationController) {
        self.navigationVC = navigationVC
    }

    func popViewController(){
        navigationVC.dismiss(animated: true, completion: nil)
    }
}
