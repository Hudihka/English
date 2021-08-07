//
//  LoadProfilePresenter.swift
//  English
//
//  Created by Константин Ирошников on 08.07.2021.
//

import Foundation

protocol LoadProfilePresenterProtocol: AnyObject {
    func finishLoadProfile(error: Error?)
    func didLoadVC()
}

class LoadProfilePresenter: LoadProfilePresenterProtocol {
    
    var interactor: LoadProfileInteractorProtocol?
    var router: LoadProfileProtocol?
    weak var view: LoadProfileViewControllerProtocol?
    
    func finishLoadProfile(error: Error?) {
        if let error = error {
            view?.resultLoadProfile(error: error)
        } else {
            router?.windowChange()
        }
    }
    
    func didLoadVC() {
        interactor?.startLoadProfile()
    }
}
