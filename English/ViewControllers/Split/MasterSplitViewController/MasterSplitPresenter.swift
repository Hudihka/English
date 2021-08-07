//
//  MasterSplitPresenter.swift
//  English
//
//  Created by Константин Ирошников on 07.08.2021.
//

import Foundation

protocol MasterSplitPresenterProtocol: AnyObject {
    func allAnswer(wordsAnswe: [WordAnswer], translateWayRusEng: Bool)
    func tapedDissmis()

    func choiceWordAnswer(answer: WordAnswer)
}

class MasterSplitPresenter: MasterSplitPresenterProtocol {

    var interactor: MasterSplitInteractorProtocol?
    var router: MasterSplitRouterProtocol?
    weak var view: MasterSplitViewControllerProtocol?

    func allAnswer(wordsAnswe: [WordAnswer], translateWayRusEng: Bool) {

//        let arrayAnswer = wordsAnswe.compactMap({$0.answer})
        let countTrue = wordsAnswe.filter({$0.answer == true}).count
        let countFalse = wordsAnswe.filter({$0.answer == false}).count

        view?.count(countTrue: countTrue, countFalse: countFalse)
        view?.startSettingsTableview(wordsAnswe: wordsAnswe, translateWayRusEng: translateWayRusEng)
    }

    func tapedDissmis() {
        router?.dissmisSplit()
    }

    func choiceWordAnswer(answer: WordAnswer){
        interactor?.choiceWordAnswer(answer)
    }
}
