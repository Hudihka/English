//
//  MasterSplitPresenter.swift
//  English
//
//  Created by Константин Ирошников on 07.08.2021.
//

import Foundation

protocol MasterSplitPresenterProtocol: AnyObject {
    func allAnswer(wordsAnswe: [WordAnswer], translateWayRusEng: Bool)
}

class MasterSplitPresenter: MasterSplitPresenterProtocol {

    var interactor: MasterSplitInteractorProtocol?
    var router: MasterSplitRouterProtocol?
    weak var view: MasterSplitViewControllerProtocol?

    func allAnswer(wordsAnswe: [WordAnswer], translateWayRusEng: Bool) {

        let countTrue = wordsAnswe.compactMap({$0.answer == true}).count
        let countFalse = wordsAnswe.compactMap({$0.answer == false}).count

        view?.count(countTrue: countTrue, countFalse: countFalse)
        view?.startSettingsTableview(wordsAnswe: wordsAnswe, translateWayRusEng: translateWayRusEng)
    }
}
