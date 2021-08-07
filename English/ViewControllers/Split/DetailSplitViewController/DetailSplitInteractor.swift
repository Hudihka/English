//
//  MasterSplitInteractor.swift
//  English
//
//  Created by Константин Ирошников on 07.08.2021.
//

import Foundation

protocol DetailSplitInteractorProtocol: AnyObject {
    var translateWayRusEng: Bool {get set}
    func answerDetailVC(wordAnswer: WordAnswer)
}

class DetailSplitInteractor: DetailSplitInteractorProtocol {
    
    var presenter: DetailSplitPresenterProtocol?

    var translateWayRusEng: Bool = true

    func answerDetailVC(wordAnswer: WordAnswer){
        presenter?.answer(ansewe: wordAnswer,
                          translateWayRusEng: translateWayRusEng)
    }
}
