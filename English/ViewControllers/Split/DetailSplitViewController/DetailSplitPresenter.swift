//
//  MasterSplitPresenter.swift
//  English
//
//  Created by Константин Ирошников on 07.08.2021.
//

import Foundation

protocol DetailSplitPresenterProtocol: AnyObject {
    func answer(ansewe: WordAnswer, translateWayRusEng: Bool)
    func tapedIndex(index: Int)

    func tapedDissmis()
}

class DetailSplitPresenter: DetailSplitPresenterProtocol {

    var interactor: DetailSplitInteractorProtocol?
    var router: DetailSplitRouterProtocol?
    weak var view: DetailSplitViewControllerProtocol?

    private var wordAnswer: WordAnswer?

    func answer(ansewe: WordAnswer, translateWayRusEng: Bool){
        wordAnswer = ansewe
        let labelTitle = translateWayRusEng ? ansewe.word.rusValue : ansewe.word.engValue
        let labelText  = !translateWayRusEng ? ansewe.word.rusValue : ansewe.word.engValue
        view?.labels(title: labelTitle,
                     label: labelText)
        
        if ansewe.answer != nil {
            view?.animate()
        } else {
            let texts = translateWayRusEng ?
                        ansewe.wordsAnswer.compactMap({$0.engValue}) :
                        ansewe.wordsAnswer.compactMap({$0.rusValue})
            view?.answerTexts(texts: texts)
        }
    }

    func tapedIndex(index: Int) {
        guard let word = wordAnswer?.wordsAnswer[safe: index] else {return}

        interactor?.choiceWord(word)
    }

    func tapedDissmis() {
        router?.dissmisSplit()
    }
}
