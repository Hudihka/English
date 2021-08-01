//
//  LoadProfileInteractor.swift
//  English
//
//  Created by Константин Ирошников on 08.07.2021.
//

import Foundation

protocol LoadProfileInteractorProtocol: AnyObject {
    func startLoadProfile()
}

class LoadProfileInteractor: LoadProfileInteractorProtocol {
    
    var presenter: LoadProfilePresenter?
    
    func startLoadProfile() {
        FirebaseData.shared.getUser {[weak self] error in
            self?.presenter?.finishLoadProfile(error: error)
        }
    }
    
}
