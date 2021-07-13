//
//  LoadProfilePresenter.swift
//  English
//
//  Created by Константин Ирошников on 08.07.2021.
//

import Foundation


protocol MenuPresenterIn: AnyObject {
    func finishLoadProfile(error: Error?)
    func autoriz()
}

class MenuPresenter: MenuPresenterIn {
    
    var interactor: MenuInteractorIn?
    var router: RouterProtocol?
    weak var view: MenuViewControllerIn?
    
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


