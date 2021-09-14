//
//  SearchInteractor.swift
//  English
//
//  Created by Константин Ирошников on 11.08.2021.
//

import Foundation

protocol SearchInteractorProtocol: AnyObject {
    func tapedLike(word: Word?)
    func seartch(text: String?)

    var compl: (wordsAndText) -> Void {get set}
}

class SearchInteractor: SearchInteractorProtocol {

    private let db = FirebaseData.shared

    var presenter: SearchPresenterProtocol?
    private var text: String?

    var compl: (wordsAndText) -> Void = {_ in }

    func tapedLike(word: Word?) {
        db.likeWord(word: word)

        guard let text = self.text else {return}
        db.wordsConteins(text: text) {[weak self] (wordsAndText) in
            self?.compl(wordsAndText)
        }
    }

    func seartch(text: String?) {
        self.text = text
        db.wordsConteins(text: self.text) {[weak self] (wordsAndText) in
            self?.compl(wordsAndText)
        }
    }
}
