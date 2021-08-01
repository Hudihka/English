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
    
    var presenter: MenuPresenter?

    init(presenter: MenuPresenter) {
        self.presenter = presenter
        self.FB.lisenProfile {[weak self] in
            guard let presenter = self?.presenter else {return}
            presenter.reloadProfile()
        }
    }

    func createdNewList(name: String){
        FB.createList(listName: name)
    }

    func renameList(oldName: String, newName: String){
        FB.renameLists(oldName: oldName, newName: newName)
    }

//    private func lissen
}
