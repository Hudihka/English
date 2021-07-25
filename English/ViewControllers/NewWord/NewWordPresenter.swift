//
//  NewWordPresenter.swift
//  English
//
//  Created by Константин Ирошников on 26.07.2021.
//

import Foundation

protocol NewWordPresenterProtocol: AnyObject {
    func tapedCancel()
}

class NewWordPresenter: NewWordPresenterProtocol {
    var interactor: NewWordInteractorProtocol?
    var router: NewWordRouterProtocol?
    weak var view: NewWordViewControllerProtocol?

    func tapedCancel(){
        router?.popViewController()
    }
}
