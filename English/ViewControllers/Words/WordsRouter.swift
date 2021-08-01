//
//  WordsRouter.swift
//  English
//
//  Created by Константин Ирошников on 01.08.2021.
//

import Foundation

protocol WordsRouterProtocol: AnyObject {
    init(navigationVC: BaseNavigationController)
}

class WordsRouter: WordsRouterProtocol {

    private var navigationVC: BaseNavigationController!

    required init(navigationVC: BaseNavigationController) {
        self.navigationVC = navigationVC
    }
    
}
