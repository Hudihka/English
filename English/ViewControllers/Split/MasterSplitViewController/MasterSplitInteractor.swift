//
//  MasterSplitInteractor.swift
//  English
//
//  Created by Константин Ирошников on 07.08.2021.
//

import Foundation

protocol MasterSplitInteractorProtocol: AnyObject {
    var translateWayRusEng: Bool {get set}
    func allAnswer(wordsAnswe: [WordAnswer])
    func correctedAnswerTwoVC(wordsAnswe: [WordAnswer])

    var choiceWordAnswer: (WordAnswer) -> Void {get set}
}

class MasterSplitInteractor: MasterSplitInteractorProtocol {
    
    var presenter: MasterSplitPresenterProtocol?

    var translateWayRusEng: Bool = true

    func allAnswer(wordsAnswe: [WordAnswer]) {
        presenter?.allAnswer(wordsAnswe: wordsAnswe, translateWayRusEng: translateWayRusEng)
    }

    func correctedAnswerTwoVC(wordsAnswe: [WordAnswer]) {
        
    }

    var choiceWordAnswer: (WordAnswer) -> Void = {_ in }
}
