//
//  LoadProfilePresenter.swift
//  English
//
//  Created by Константин Ирошников on 08.07.2021.
//

import Foundation


protocol AutorisationPresenterProtocol: AnyObject {
    func finishLoadProfile(error: Error?)
    func autoriz()
}

class AutorisationPresenter: AutorisationPresenterProtocol {
    
    var interactor: AutorisationInteractorProtocol?
    var router: AutorisationRouterProtocol?
    weak var view: AutorisationViewControllerProtocol?
    
    func finishLoadProfile(error: Error?) {
        BluereViewController.hide()
        if let error = error {
            view?.resultLoadProfile(error: error)
        } else {
            router?.windowChange()
        }
    }
    
    func autoriz() {
        BluereViewController.route()
        interactor?.startLoadProfile()
    }
    
}

