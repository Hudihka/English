//
//  SearchInteractor.swift
//  English
//
//  Created by Константин Ирошников on 11.08.2021.
//

import Foundation

protocol SearchInteractorProtocol: AnyObject {
}

class SearchInteractor: SearchInteractorProtocol {

    private let FB = FirebaseData.shared

    var presenter: SearchPresenterProtocol?

    
}
