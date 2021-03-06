//
//  LoadProfilePresenter.swift
//  English
//
//  Created by Константин Ирошников on 08.07.2021.
//

import Foundation


protocol MenuPresenterProtocol: AnyObject {
    func tapedAlert(_ alertButton: MenuEndpointsEnum.ActionButtonsAlert, list: List?)
    func createList(name: String)
    func renameList(oldName: String, newName: String)
    func reloadProfile()
    func newWordInTheme(list: List)
}

class MenuPresenter: MenuPresenterProtocol {

    var interactor: MenuInteractorProtocol?
    var router: MenuRouterProtocol?
    weak var view: MenuViewControllerProtocol?
    
    func tapedAlert(_ alertButton: MenuEndpointsEnum.ActionButtonsAlert,
					list: List?) { //если лист нил значит фаворит

        switch alertButton {
        case .rusEngl, .englRus:
            router?.presentSplit(list: list,
                                 way: alertButton)
        case .cramming:
            router?.pushCramming(list: list)
        case .title:
            break
        }
    }

    func createList(name: String){
        if busyName(name) {
            view?.showErrorNewList()
        } else {
            interactor?.createdNewList(name: name)
        }
    }

    func renameList(oldName: String, newName: String) {
        if busyName(newName) {
            view?.showErrorNewList()
        } else {
            interactor?.renameList(oldName: oldName, newName: newName)
        }
    }

    func reloadProfile(){
        view?.reloadData()
    }

    func newWordInTheme(list: List){
        router?.newWordInTheme(list: list)
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


