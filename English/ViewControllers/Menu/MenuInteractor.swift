//
//  MenuInteractor.swift
//  English
//
//  Created by Константин Ирошников on 14.07.2021.
//

import Foundation

protocol MenuInteractorIn: AnyObject {
    func startLoadProfile()
}

class MenuInteractor: MenuInteractorIn {
    
    var presenter: MenuPresenter?
    
    private let autorised = FirebaseAutorization.shared
    
    func startLoadProfile() {
        autorised.isAutoriseid = {[weak self] error in
            self?.presenter?.finishLoadProfile(error: error)
        }
        autorised.startAutorisation()
    }
}
