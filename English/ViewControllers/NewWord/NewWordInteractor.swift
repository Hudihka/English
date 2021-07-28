//
//  NewWordInteractor.swift
//  English
//
//  Created by Константин Ирошников on 26.07.2021.
//

import Foundation

protocol NewWordInteractorProtocol: AnyObject {
	func create(word: Word)
	func reload(word: Word)
    init(list: List)
}

class NewWordInteractor: NewWordInteractorProtocol {
	
    private var list: List!

    var presenter: NewWordPresenterProtocol?

    required init(list: List){
        self.list = list
    }
    
	func reload(word: Word) {
		
	}
	
	func create(word: Word) {
		
	}
}
