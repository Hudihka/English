//
//  LoadProfilePresenter.swift
//  English
//
//  Created by Константин Ирошников on 08.07.2021.
//

import Foundation

protocol SearchPresenterProtocol: AnyObject {
    func saveWay(index: Int)

    func tapedLike(word: Word?)
    func changeWord(word: Word?)
}

class SearchPresenter: SearchPresenterProtocol {

    var interactor: SearchInteractorProtocol?
    var router: SearchRouterProtocol?
    weak var view: SearchViewControllerProtocol?

    private var defUt = DefaultUtils.shared

    func saveWay(index: Int) {
        self.defUt.translateWay = index
    }

    //action
    func tapedLike(word: Word?) {
        interactor?.tapedLike(word: word)
    }

    func changeWord(word: Word?){
        router?.newWordInTheme(word: word)
    }
}



