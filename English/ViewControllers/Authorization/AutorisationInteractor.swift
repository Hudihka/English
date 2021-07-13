//
//  LoadProfileInteractor.swift
//  English
//
//  Created by Константин Ирошников on 08.07.2021.
//

import Foundation

protocol AutorisationInteractorIn: AnyObject {
    func startLoadProfile()
}

class AutorisationInteractor: AutorisationInteractorIn {
    
    var presenter: AutorisationPresenter?
    
    private let autorised = FirebaseAutorization.shared
    
    func startLoadProfile() {
        autorised.isAutoriseid = {[weak self] error in
            self?.presenter?.finishLoadProfile(error: error)
        }
        autorised.startAutorisation()
    }
}

