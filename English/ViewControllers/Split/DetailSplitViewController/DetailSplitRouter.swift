//
//  MasterSplitRouter.swift
//  English
//
//  Created by Константин Ирошников on 07.08.2021.
//

import Foundation
import UIKit

protocol DetailSplitRouterProtocol: AnyObject {
    func dissmisSplit()

    init(SVC: UIViewController)
}

class DetailSplitRouter: DetailSplitRouterProtocol {

    var presenter: DetailSplitPresenterProtocol?
    private var SVC: UIViewController!

    required init(SVC: UIViewController){
        self.SVC = SVC
    }

    func dissmisSplit() {
        SplitViewController.activeSplitVC = false
        SVC.dismiss(animated: true, completion: nil)
    }

}
