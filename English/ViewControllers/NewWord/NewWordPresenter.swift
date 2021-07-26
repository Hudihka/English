//
//  NewWordPresenter.swift
//  English
//
//  Created by Константин Ирошников on 26.07.2021.
//

import Foundation

protocol NewWordPresenterProtocol: AnyObject {
    func tapedCancel()
	
	init(oldWord: Word?)
}

class NewWordPresenter: NewWordPresenterProtocol {
    var interactor: NewWordInteractorProtocol?
    var router: NewWordRouterProtocol?
    weak var view: NewWordViewControllerProtocol?
	
	private var oldWord: Word?
	
	required init(oldWord: Word?){
		self.oldWord = oldWord
	}

    func tapedCancel(){
        router?.popViewController()
    }
}
