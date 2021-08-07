//
//  MenuInteractor.swift
//  English
//
//  Created by Константин Ирошников on 14.07.2021.
//

import Foundation

protocol MenuInteractorProtocol: AnyObject {
    func createdNewList(name: String)
    func renameList(oldName: String, newName: String)
	func deleteList(name: String)

    init(presenter: MenuPresenterProtocol)
}

class MenuInteractor: MenuInteractorProtocol {

    private let FB = FirebaseData.shared
    
    var presenter: MenuPresenterProtocol?

    required init(presenter: MenuPresenterProtocol) {
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
	
	func deleteList(name: String) {
		FB.deleteList(listName: name)
	}

//    private func lissen
}
