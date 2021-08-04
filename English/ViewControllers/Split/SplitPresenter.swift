//
//  SplitPresenter.swift
//  English
//
//  Created by Константин Ирошников on 05.08.2021.
//

import Foundation

protocol SplitPresenterProtocol: AnyObject {
//    func fetchData()
//    func saveSwitch(isOn: Bool)
//    func saveWay(index: Int)
//
//    func tapedLike(word: Word?)
//    func delete(word: Word)
//    func changeWord(word: Word?)

    init(interactor: SplitInteractorProtocol) //если лист нил значит фаворит
}

class SplitPresenter: SplitPresenterProtocol {

    var interactor: SplitInteractorProtocol?
    var router: SplitRouterProtocol?
    weak var view: SplitViewControllerProtocol?

    required init(interactor: SplitInteractorProtocol) {
        self.interactor = interactor

        interactor.lissenWords {[weak self] words in
//            self?.view?.words(words: words)
        }
    }

}


