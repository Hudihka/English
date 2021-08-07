//
//  MasterSplitRouter.swift
//  English
//
//  Created by Константин Ирошников on 07.08.2021.
//

import Foundation

protocol DetailSplitRouterProtocol: AnyObject {
//    func dissmis()

//    init(navigationVC: BaseNavigationController)
}

class DetailSplitRouter: DetailSplitRouterProtocol {

    var presenter: DetailSplitPresenterProtocol?

//    private var navigationVC: BaseNavigationController!
//
//    required init(navigationVC: BaseNavigationController, list: List?) {
//        self.navigationVC = navigationVC
//    }
//
//    func dissmis() {
//        navigationVC.dismiss(animated: true, completion: nil)
//    }
}
