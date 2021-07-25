//
//  LoadProfilePresenter.swift
//  English
//
//  Created by Константин Ирошников on 08.07.2021.
//

import Foundation


protocol AutorisationPresenterIn: AnyObject {
    func finishLoadProfile(error: Error?)
    func autoriz()
}

class AutorisationPresenter: AutorisationPresenterIn {
    
    var interactor: AutorisationInteractorIn?
    var router: AutorisationRouterProtocol?
    weak var view: AutorisationViewControllerIn?
    
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

