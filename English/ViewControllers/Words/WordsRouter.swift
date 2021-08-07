//
//  WordsRouter.swift
//  English
//
//  Created by Константин Ирошников on 01.08.2021.
//

import Foundation

protocol WordsRouterProtocol: AnyObject {
    func newWordInTheme(word: Word?)
    
    init(navigationVC: BaseNavigationController, list: List?)
}

class WordsRouter: WordsRouterProtocol {

    private var navigationVC: BaseNavigationController!
    private var list: List?

    required init(navigationVC: BaseNavigationController, list: List?) {
        self.navigationVC = navigationVC
        self.list = list
    }

    func newWordInTheme(word: Word?) {
        guard let list = list else { return }
        let NVC = DI.newWordViewController(list: list, oldWord: word)
        navigationVC.present(NVC, animated: true, completion: nil)
    }
}
