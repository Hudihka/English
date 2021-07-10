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
    
    func startLoadProfile() {
        FirebaseData.shared.getUser {[weak self] error in
            self?.finishLoadProfile(error: error)
        }
    }
    
}
