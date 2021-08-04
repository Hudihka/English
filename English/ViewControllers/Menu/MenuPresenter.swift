//
//  LoadProfilePresenter.swift
//  English
//
//  Created by Константин Ирошников on 08.07.2021.
//

import Foundation


protocol MenuPresenterProtocol: AnyObject {
    func tapedAlert(_ alertButton: MenuEndpointsEnum.ActionButtonsAlert, list: List?, NVC: BaseNavigationController?)
    func createList(name: String)
    func renameList(oldName: String, newName: String)
	func deleteList(name: String)
    func reloadProfile()
    func newWordInTheme(list: List)
}

class MenuPresenter: MenuPresenterProtocol {

    var interactor: MenuInteractorProtocol?
    var router: MenuRouterProtocol?
    weak var view: MenuViewControllerProtocol?
    
    func tapedAlert(_ alertButton: MenuEndpointsEnum.ActionButtonsAlert,
                    list: List?, //если лист нил значит фаворит
                    NVC: BaseNavigationController?) {

        switch alertButton {
        case .rusEngl:
            print("------1")
        case .englRus:
            print("------2")
        case .cramming:
            if let NVC = NVC {
                router?.pushCramming(list: list, NVC: NVC)
            }
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
	
	func deleteList(name: String) {
		interactor?.deleteList(name: name)
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


