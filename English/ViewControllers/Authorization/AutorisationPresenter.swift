//
//  LoadProfilePresenter.swift
//  English
//
//  Created by Константин Ирошников on 08.07.2021.
//

import Foundation

//все сообщения другим классам
//protocol LoadProfilePresenterOut: AnyObject {
//
//}

//все сообщения от других классов
protocol AutorisationPresenterIn: AnyObject {
    func finishLoadProfile(error: Error?)
    func autoriz()
}

class AutorisationPresenter: AutorisationPresenterIn {
    
    var interactor: AutorisationInteractorIn?
    var router: RouterProtocol?
    weak var view: AutorisationViewControllerIn?
    
    func finishLoadProfile(error: Error?) {
        if let error = error {
            view?.resultLoadProfile(error: error)
        } else {
            router?.windowChange()
        }
    }
    
    func autoriz() {
        interactor?.startLoadProfile()
    }
    
}

