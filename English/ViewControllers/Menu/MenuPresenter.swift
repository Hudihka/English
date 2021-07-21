//
//  LoadProfilePresenter.swift
//  English
//
//  Created by Константин Ирошников on 08.07.2021.
//

import Foundation


protocol MenuPresenterIn: AnyObject {
    func tapedAlert(_ alertButton: MenuEndpointsEnum.ActionButtonsAlert, theme: String)
    func createList(name: String)
}

class MenuPresenter: MenuPresenterIn {
    
    var interactor: MenuInteractorIn?
    var router: RouterProtocol?
    weak var view: MenuViewControllerIn?
    
    func tapedAlert(_ alertButton: MenuEndpointsEnum.ActionButtonsAlert, theme: String) {
        switch alertButton {
        case .rusEngl:
            print("------1")
        case .englRus:
            print("------2")
        case .cramming:
            print("------3")
        }
    }

    func createList(name: String){

        if busyName(name) {
            view?.showErrorNewList()
        } else {
            //создаем в интеракторе 
        }
        
    }

    //private func

    private func busyName(_ name: String) -> Bool {

        let element = name.lowercased()

        if element == FAVORIT_NAME.lowercased() {
            return true
        }

        let arrayNames = FirebaseData.shared.profile?.lists.compactMap({$0.name.lowercased()}) ?? []

        return arrayNames.contains(element)
    }
}


