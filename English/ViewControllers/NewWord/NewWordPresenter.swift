//
//  NewWordPresenter.swift
//  English
//
//  Created by Константин Ирошников on 26.07.2021.
//

import Foundation
import UIKit

protocol NewWordPresenterProtocol: AnyObject {
    func tapedCancel()
	func fetchData()
    func fetchTitle()
	
	func tapedMix()
	func createWord()
    func createAndAddWord()

    func copyText(tag: Int)
	
	func textInTF(rusText: String?, engText: String?, description: String?)
	
	init(oldWord: Word?,
         list: List,
         isBeginHide: Bool)
}

class NewWordPresenter: NewWordPresenterProtocol {
    var interactor: NewWordInteractorProtocol?
    var router: NewWordRouterProtocol?
    weak var view: NewWordViewControllerProtocol?
	
	private var oldWord: Word?
	private var newWord: Word?
    private var list: List!
    private var isBeginHide: Bool!
	
    required init(oldWord: Word?, list: List, isBeginHide: Bool){
		self.oldWord = oldWord
		self.newWord = oldWord
        self.list = list
        self.isBeginHide = isBeginHide
	}

    func fetchTitle(){
        self.view?.title(text: oldWord == nil ?
                            NewWordEndpoits.TitleText.newWord.rawValue :
                            NewWordEndpoits.TitleText.change.rawValue)
    }

    func tapedCancel(){
        router?.popViewController()
    }
	
	func fetchData(){
        view?.isHidenBeginButton(isHiden: isBeginHide)
		view?.startData(word: newWord)
		view?.enabledData(enabledAdd: enabledAdd,
                          enabledMix: enabledMixedd)
        view?.enableCopy(enableCopyTop: isEnabledTop,
                        enableCopyBottom: isEnabledBottom)
        view?.titleButton(text: oldWord == nil ? NewWordEndpoits.ButtonText.add.rawValue :
                            NewWordEndpoits.ButtonText.change.rawValue)
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
		
		newWord?.rusValue = eng
		newWord?.engValue = rus
		
		fetchData()
	}
	
	func createWord() {
		guard let newWord = newWord else { return }
		if oldWord == nil {
            interactor?.create(word: newWord, list: list)
            tapedCancel()
		} else {
            interactor?.reload(word: newWord)
		}
	}

    func createAndAddWord() {
        guard let newWord = newWord else { return }
        interactor?.create(word: newWord, list: list)

        self.oldWord = nil
        self.newWord = nil

        view?.startData(word: self.newWord)
        view?.enabledData(enabledAdd: enabledAdd,
                          enabledMix: enabledMixedd)
        view?.enableCopy(enableCopyTop: isEnabledTop,
                        enableCopyBottom: isEnabledBottom)
    }
	
	func textInTF(rusText: String?, engText: String?, description: String?){
		if newWord == nil {
            let json = ["listName" : list.name]
            newWord = Word(json: json, id: nil)
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
		
		view?.enabledData(enabledAdd: enabledAdd,
                          enabledMix: enabledMixedd)

        view?.enableCopy(enableCopyTop: isEnabledTop,
                        enableCopyBottom: isEnabledBottom)
	}


    func copyText(tag: Int){
        let text = tag == 0 ? newWord?.rusValue : newWord?.engValue
        if let text = text {
            UIPasteboard.general.string = text
        }
        view?.enableCopy(enableCopyTop: isEnabledTop,
                        enableCopyBottom: isEnabledBottom)
    }

    private var isEnabledTop: Bool {
        if let text = newWord?.rusValue.textEditor,
           let textBuffer = UIPasteboard.general.string {
            return textBuffer != text
        }
        return false
    }

    private var isEnabledBottom: Bool {
        if let text = newWord?.engValue.textEditor,
           let textBuffer = UIPasteboard.general.string {
            return textBuffer != text
        }
        return false
    }
}
