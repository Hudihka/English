//
//  MenuRouter.swift
//  English
//
//  Created by Константин Ирошников on 14.07.2021.
//

import Foundation
import UIKit

protocol MenuRouterProtocol: AnyObject {
    func presentSplit(words: [Word], way: MenuEndpointsEnum.ActionButtonsAlert)
    func pushCramming(list: List?, NVC: BaseNavigationController)
    func newWordInTheme(list: List)

    init(navigationVC: BaseNavigationController)
}

class MenuRouter: MenuRouterProtocol{
    private let navigationVC: BaseNavigationController!

    required init(navigationVC: BaseNavigationController){
        self.navigationVC = navigationVC
    }

    func presentSplit(words: [Word], way: MenuEndpointsEnum.ActionButtonsAlert) {

    }

    func pushCramming(list: List?, NVC: BaseNavigationController) {
        let VC = DI.wordsViewController(list: list, NVC: NVC)
        self.navigationVC.pushViewController(viewController: VC, completion: nil)
    }

    func newWordInTheme(list: List) {
		let NVC = DI.newWordViewController(list: list, oldWord: nil)
        navigationVC.present(NVC, animated: true, completion: nil)
    }
}
