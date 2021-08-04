//
//  WordsRouter.swift
//  English
//
//  Created by Константин Ирошников on 01.08.2021.
//

import Foundation

protocol WordsRouterProtocol: AnyObject {
    func newWordInTheme(list: List, word: Word?)
    
    init(navigationVC: BaseNavigationController)
}

class WordsRouter: WordsRouterProtocol {

    private var navigationVC: BaseNavigationController!

    required init(navigationVC: BaseNavigationController) {
        self.navigationVC = navigationVC
    }


    func newWordInTheme(list: List, word: Word?) {
        let NVC = DI.newWordViewController(list: list, oldWord: word)
        navigationVC.present(NVC, animated: true, completion: nil)
    }
}
