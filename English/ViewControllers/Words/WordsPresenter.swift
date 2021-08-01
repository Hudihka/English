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

    init(interactor: WordsInteractorProtocol, list: List?) //если лист нил значит фаворит
}

class WordsPresenter: WordsPresenterProtocol {

    var interactor: WordsInteractorProtocol?
    var router: WordsRouterProtocol?
    weak var view: WordViewControllerProtocol?

    private var defUt = DefaultUtils.shared
    private var list: List?
    
    required init(interactor: WordsInteractorProtocol, list: List?) {
        self.list = list
    }

    func fetchData() {
        view?.fetchTitle(text: list?.name ?? "ФАВОРИТ")
        view?.fetchSegmentControll(index: defUt.translateWay)
        view?.fetchSwitch(isOn: defUt.hideTranslate)
    }

    func saveSwitch(isOn: Bool) {
        self.defUt.hideTranslate = isOn
    }

    func saveWay(index: Int) {
        self.defUt.translateWay = index
    }

}
