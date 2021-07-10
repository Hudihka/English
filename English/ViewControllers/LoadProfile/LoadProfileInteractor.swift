//
//  LoadProfileInteractor.swift
//  English
//
//  Created by Константин Ирошников on 08.07.2021.
//

import Foundation

protocol LoadProfileInteractorIn: AnyObject {
    func startLoadProfile()
}

class LoadProfileInteractor: LoadProfileInteractorIn {
    
    var presenter: LoadProfilePresenter?
    
    func startLoadProfile() {
        FirebaseData.shared.getUser {[weak self] error in
            presenter?.finishLoadProfile(error: error)
        }
    }
    
}
