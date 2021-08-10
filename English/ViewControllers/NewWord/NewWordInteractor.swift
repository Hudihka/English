//
//  NewWordInteractor.swift
//  English
//
//  Created by Константин Ирошников on 26.07.2021.
//

import Foundation

protocol NewWordInteractorProtocol: AnyObject {
    func create(word: Word, list: List)
	func reload(word: Word)
}

class NewWordInteractor: NewWordInteractorProtocol {

    private let db = FirebaseData.shared

    var presenter: NewWordPresenterProtocol?
    
	func reload(word: Word){
        db.renameWord(newWord: word)
        presenter?.tapedCancel()
	}
	
	func create(word: Word, list: List) {
        db.createWord(newWord: word, list: list)
	}
}
