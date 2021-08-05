//
//  SplitPresenter.swift
//  English
//
//  Created by Константин Ирошников on 05.08.2021.
//

import Foundation

protocol SplitPresenterProtocol: AnyObject {
    func tapedAnswer(word: Word)
    func choseWordToCheck(word: Word)
//
//    func tapedLike(word: Word?)
//    func delete(word: Word)
//    func changeWord(word: Word?)

    init(interactor: SplitInteractorProtocol, wayTranslate: MenuEndpointsEnum.ActionButtonsAlert)
}

class SplitPresenter: SplitPresenterProtocol {

    var interactor: SplitInteractorProtocol?
    var router: SplitRouterProtocol?
    weak var view: SplitViewControllerProtocol?

    private var answerWords = [WordAnswer]()
    private var allWord = [Word]()
    private let wayTranslate: MenuEndpointsEnum.ActionButtonsAlert!

    required init(interactor: SplitInteractorProtocol,
                  wayTranslate: MenuEndpointsEnum.ActionButtonsAlert) {

        self.interactor = interactor
        self.wayTranslate = wayTranslate

        interactor.lissenWords {[weak self] words in
            guard let self = self else {return}
            self.allWord = words
            self.answerWords = words.map({WordAnswer(word: $0)})
            self.view?.answer(wordsAnswe: self.answerWords,
                              translateWayRusEng: self.wayTranslate == .rusEngl)
        }
    }

    func tapedAnswer(word: Word) { //выбрали ответ
        guard let index = index(word: word) else {return}

        var answer = answerWords[index]
        answer.creteAnswer(word: word)
        answerWords[index] = answer
		
		view?.correctedAnswerTwoVC(wordsAnswe: answerWords)
    }

    func choseWordToCheck(word: Word) { //выбрали слово для проверки
        guard let index = index(word: word) else {return}

        var answer = answerWords[index]
        answer.createWordsAnswers(allWords: allWord)
        answerWords[index] = answer
		
		view?.answerDetailVC(wordAnswer: answer)
    }

    private func index(word: Word) -> Int? {
        return answerWords.firstIndex(where: {$0.word == word})
    }

}


