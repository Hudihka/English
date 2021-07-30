//
//  NewWordPresenter.swift
//  English
//
//  Created by Константин Ирошников on 26.07.2021.
//

import Foundation

protocol NewWordPresenterProtocol: AnyObject {
    func tapedCancel()
	func fetchData()
	
	func tapedMix()
	func createWord()
	
	func textInTF(rusText: String?, engText: String?, description: String?)
	
	init(oldWord: Word?)
}

class NewWordPresenter: NewWordPresenterProtocol {
    var interactor: NewWordInteractorProtocol?
    var router: NewWordRouterProtocol?
    weak var view: NewWordViewControllerProtocol?
	
	private var oldWord: Word?
	private var newWord: Word?
	
	required init(oldWord: Word?){
		self.oldWord = oldWord
		self.newWord = oldWord
	}

    func tapedCancel(){
        router?.popViewController()
    }
	
	func fetchData(){
		view?.startData(word: newWord)
		view?.enabledData(enabledAdd: enabledAdd, enabledMix: enabledMixedd)
	}
	
	private var enabledAdd: Bool{
		if newWord?.rusValue.textEditor != nil,
		   newWord?.engValue.textEditor != nil {
			return newWord != oldWord
		}
		
		return false
	}
	
	private var enabledMixedd: Bool{
		if newWord?.rusValue.textEditor != nil ||
			newWord?.engValue.textEditor != nil {
			return true
		}
		return false
	}
	
	func tapedMix(){
		let rus = newWord?.rusValue ?? ""
		let eng = newWord?.engValue ?? ""
		
		newWord?.rusValue = rus
		newWord?.engValue = eng
		
		fetchData()
	}
	
	func createWord() {
		guard let newWord = newWord else { return }
		if oldWord == nil {
			interactor?.create(word: newWord)
		} else {
			interactor?.reload(word: newWord)
		}
	}
	
	func textInTF(rusText: String?, engText: String?, description: String?){
		if newWord == nil {
			newWord = Word(json: [:])
		}
		
		if let rusText = rusText {
			newWord?.rusValue = rusText
		}
		
		if let engText = engText {
			newWord?.engValue = engText
		}
		
		if let description = description {
			newWord?.descript = description
		}
		
		view?.enabledData(enabledAdd: enabledAdd, enabledMix: enabledMixedd)
	}
	
}
