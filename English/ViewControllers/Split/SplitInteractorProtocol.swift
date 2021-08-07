//
//  SplitInteractorProtocol.swift
//  English
//
//  Created by Константин Ирошников on 05.08.2021.
//

import Foundation

protocol SplitInteractorProtocol: AnyObject {
    func lissenWords(compl: @escaping(([Word]) -> Void))
//    func tapedAnswer(word: Word)
//    func choseWordToCheck(word: WordAnswer)


    init(list: List?)
}

class SplitInteractor: SplitInteractorProtocol {
    var presenter: SplitPresenterProtocol?

    private let db = FirebaseData.shared
    private var list: List?
    private var oneUpdate = false

    required init(list: List?) {
        self.list = list
    }

    func lissenWords(compl: @escaping(([Word]) -> Void)) {
        db.lisenWord(list: list) {[weak self] (words) in
            guard let self = self else {return}
            if self.oneUpdate == false {
                self.oneUpdate = true
                compl(words)
            }
        }
    }

//    func tapedAnswer(word: Word){
//        presenter?.tapedAnswer(word: word)
//    }
//
//    func choseWordToCheck(word: WordAnswer){
//        presenter?.choseWordToCheck(wordAnser: word)
//    }
}
