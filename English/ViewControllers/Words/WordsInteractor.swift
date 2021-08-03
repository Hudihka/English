//
//  WordsInteractor.swift
//  English
//
//  Created by Константин Ирошников on 01.08.2021.
//

import Foundation

protocol WordsInteractorProtocol: AnyObject {
    func lissenWords(compl: @escaping(([Word]) -> Void))
	func tapedLike(word: Word?)
    var list: List? {get set}

    init(list: List?)
}

class WordsInteractor: WordsInteractorProtocol {

    private let db = FirebaseData.shared

    var presenter: WordsPresenterProtocol?

    var list: List?

    required init(list: List?) {
        self.list = list
    }

    func lissenWords(compl: @escaping(([Word]) -> Void)) {
        db.lisenWord(list: list) { (words) in
            compl(words)
        }
    }
	
	func tapedLike(word: Word?) {
		db.likeWord(word: word)
	}
}
