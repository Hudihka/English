//
//  MasterSplitPresenter.swift
//  English
//
//  Created by Константин Ирошников on 07.08.2021.
//

import Foundation

protocol DetailSplitPresenterProtocol: AnyObject {
    func answer(ansewe: WordAnswer, translateWayRusEng: Bool)
    func tapedDissmis()
}

class DetailSplitPresenter: DetailSplitPresenterProtocol {

    var interactor: DetailSplitInteractorProtocol?
    var router: DetailSplitRouterProtocol?
    weak var view: DetailSplitViewControllerProtocol?

    func answer(ansewe: WordAnswer, translateWayRusEng: Bool){
        let labelTitle = translateWayRusEng ? ansewe.word.rusValue : ansewe.word.engValue
        view?.labelTitle(text: labelTitle)
        
        if ansewe.answer != nil {
            let textLabel = translateWayRusEng ? ansewe.word.engValue : ansewe.word.rusValue
            view?.labelText(text: textLabel)
        } else {
            let texts = translateWayRusEng ?
                        ansewe.wordsAnswer.compactMap({$0.engValue}) :
                        ansewe.wordsAnswer.compactMap({$0.rusValue})
            view?.answerTexts(texts: texts)
        }
    }

    func tapedDissmis() {
        router?.dissmisSplit()
    }
}
