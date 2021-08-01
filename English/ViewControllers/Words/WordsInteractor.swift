//
//  WordsInteractor.swift
//  English
//
//  Created by Константин Ирошников on 01.08.2021.
//

import Foundation

protocol WordsInteractorProtocol: AnyObject {
    
}

class WordsInteractor: WordsInteractorProtocol {

    private let db = FirebaseData.shared

    var presenter: WordsPresenterProtocol?

}
