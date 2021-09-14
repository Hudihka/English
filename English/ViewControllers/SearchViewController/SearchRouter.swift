//
//  SearchRouter.swift
//  English
//
//  Created by Константин Ирошников on 12.08.2021.
//

import Foundation

protocol SearchRouterProtocol: AnyObject {
    func changeWordTheme(word: Word?, list: List?)

    init(navigationVC: BaseNavigationController)
}

class SearchRouter: SearchRouterProtocol {

    private var navigationVC: BaseNavigationController!

    required init(navigationVC: BaseNavigationController) {
        self.navigationVC = navigationVC
    }

    func changeWordTheme(word: Word?, list: List?) {
        guard let list = list else { return }
        let NVC = DI.newWordViewController(list: list, oldWord: word)
        navigationVC.present(NVC, animated: true, completion: nil)
    }
}
