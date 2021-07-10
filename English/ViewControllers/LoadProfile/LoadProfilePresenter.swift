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
protocol LoadProfilePresenterIn: AnyObject {
    func finishLoadProfile(error: Error?)
    func didLoadVC()
}

class LoadProfilePresenter: LoadProfilePresenterIn {
    
    var interactor: LoadProfileInteractorIn?
    var router: RouterProtocol?
    var view: LoadProfileViewControllerIn?
    
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
