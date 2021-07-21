//
//  MenuInteractor.swift
//  English
//
//  Created by Константин Ирошников on 14.07.2021.
//

import Foundation

protocol MenuInteractorIn: AnyObject {
    func createdNewList(name: String)
}

class MenuInteractor: MenuInteractorIn {
    
    var presenter: MenuPresenter?

    func createdNewList(name: String){

    }

//    private func lissen
}
