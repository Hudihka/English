//
//  MenuInteractor.swift
//  English
//
//  Created by Константин Ирошников on 14.07.2021.
//

import Foundation

protocol MenuInteractorIn: AnyObject {
    func createdNewList(name: String)
    func renameList(oldName: String, newName: String)
}

class MenuInteractor: MenuInteractorIn {

    private let FB = FirebaseData.shared
    
    private var presenter: MenuPresenter?

    init(presenter: MenuPresenter) {
        self.presenter = presenter
    }

    func createdNewList(name: String){
        FB.createdNewList(name)
    }

    func renameList(oldName: String, newName: String){
        FB.renameLists(oldName: oldName, newName: newName)
    }

//    private func lissen
}
