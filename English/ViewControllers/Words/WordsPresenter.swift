//
//  WordsPresenter.swift
//  English
//
//  Created by Константин Ирошников on 01.08.2021.
//

import Foundation

protocol WordsPresenterProtocol: AnyObject {
    func fetchData()
    func saveSwitch(isOn: Bool)
    func saveWay(index: Int)
	
	func tapedLike(word: Word?)
    func delete(word: Word?)
    func changeWord(word: Word)

    init(interactor: WordsInteractorProtocol) //если лист нил значит фаворит
}

class WordsPresenter: WordsPresenterProtocol {

    var interactor: WordsInteractorProtocol?
    var router: WordsRouterProtocol?
    weak var view: WordViewControllerProtocol?

    private var defUt = DefaultUtils.shared

    required init(interactor: WordsInteractorProtocol) {
        self.interactor = interactor

        interactor.lissenWords {[weak self] words in
            self?.view?.words(words: words)
        }
    }

    func fetchData() {
        view?.fetchTitle(text: interactor?.list?.name ?? WordsEndpoint.Text.title.rawValue)
        view?.fetchSegmentControll(index: defUt.translateWay)
        view?.fetchSwitch(isOn: defUt.hideTranslate)
    }

    func saveSwitch(isOn: Bool) {
        self.defUt.hideTranslate = isOn
    }

    func saveWay(index: Int) {
        self.defUt.translateWay = index
    }

	//action
    func tapedLike(word: Word?) {
		interactor?.tapedLike(word: word)
    }

    func delete(word: Word?){
        interactor?.delete(word: word)
    }

    func changeWord(word: Word){
        if let list = FirebaseData.shared.profile?.lists.first(where: {$0.name == word.listName}){
            router?.newWordInTheme(list: list, word: word)
        }
    }

}
