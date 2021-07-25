//
//  NewWordInteractor.swift
//  English
//
//  Created by Константин Ирошников on 26.07.2021.
//

import Foundation

protocol NewWordInteractorProtocol: AnyObject {
    init(nameList: String)
}

class NewWordInteractor: NewWordInteractorProtocol {
    private var nameList: String!

    var presenter: NewWordPresenterProtocol?

    required init(nameList: String){
        self.nameList = nameList
    }
    
}
