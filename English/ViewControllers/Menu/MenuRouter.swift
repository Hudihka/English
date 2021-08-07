//
//  MenuRouter.swift
//  English
//
//  Created by Константин Ирошников on 14.07.2021.
//

import Foundation
import UIKit

protocol MenuRouterProtocol: AnyObject {
    func presentSplit(list: List?, way: MenuEndpointsEnum.ActionButtonsAlert)
    func pushCramming(list: List?)
    func newWordInTheme(list: List)

    init(navigationVC: BaseNavigationController)
}

class MenuRouter: MenuRouterProtocol{
    private let navigationVC: BaseNavigationController!

    required init(navigationVC: BaseNavigationController){
        self.navigationVC = navigationVC
    }

    func presentSplit(list: List?, way: MenuEndpointsEnum.ActionButtonsAlert) {
        let VC = DI.splitViewController(list: list, wayTranslate: way)
        VC.modalPresentationStyle = .fullScreen
        navigationVC.present(VC, animated: true, completion: nil)
    }

    func pushCramming(list: List?) {
        let VC = DI.wordsViewController(list: list, NVC: navigationVC)
        self.navigationVC.pushViewController(viewController: VC, completion: nil)
    }

    func newWordInTheme(list: List) {
		let NVC = DI.newWordViewController(list: list, oldWord: nil)
        navigationVC.present(NVC, animated: true, completion: nil)
    }
}
