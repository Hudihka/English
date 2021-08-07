//
//  MasterSplitRouter.swift
//  English
//
//  Created by Константин Ирошников on 07.08.2021.
//

import Foundation
import UIKit

protocol MasterSplitRouterProtocol: AnyObject {
    func dissmisSplit()

    init(SVC: UIViewController)
}

class MasterSplitRouter: MasterSplitRouterProtocol {

    var presenter: MasterSplitPresenterProtocol?
    private var SVC: UIViewController!

    required init(SVC: UIViewController){
        self.SVC = SVC
    }

    func dissmisSplit() {
        SVC.dismiss(animated: true, completion: nil)
    }
//
//    required init(navigationVC: BaseNavigationController, list: List?) {
//        self.navigationVC = navigationVC
//    }
//
//    func dissmis() {
//        navigationVC.dismiss(animated: true, completion: nil)
//    }
}
