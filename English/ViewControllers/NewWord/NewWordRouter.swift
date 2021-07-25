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
    init(navigationVC: UINavigationController)
}

class NewWordRouter: NewWordRouterProtocol{
    private var navigationVC: UINavigationController!

    required init(navigationVC: UINavigationController) {
        self.navigationVC = navigationVC
    }

    func popViewController(){
        navigationVC.dismiss(animated: true, completion: nil)
    }
}
