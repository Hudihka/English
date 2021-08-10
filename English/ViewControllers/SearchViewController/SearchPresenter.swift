//
//  LoadProfilePresenter.swift
//  English
//
//  Created by Константин Ирошников on 08.07.2021.
//

import Foundation

protocol SearchPresenterProtocol: AnyObject {
}

class SearchPresenter: SearchPresenterProtocol {

    var interactor: SearchInteractorProtocol?
    weak var view: SearchViewControllerProtocol?

 
}



