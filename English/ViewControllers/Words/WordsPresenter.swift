//
//  WordsPresenter.swift
//  English
//
//  Created by Константин Ирошников on 01.08.2021.
//

import Foundation

protocol WordsPresenterProtocol: AnyObject {
    init(interactor: WordsInteractorProtocol, list: List)
}

class WordsPresenter: WordsPresenterProtocol {

    var interactor: WordsInteractorProtocol?
    var router: WordsRouterProtocol?
    weak var view: WordViewControllerProtocol?
    
    required init(interactor: WordsInteractorProtocol, list: List) {
        
    }


}
