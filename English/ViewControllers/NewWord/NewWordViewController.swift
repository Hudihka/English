//
//  NewWordViewController.swift
//  English
//
//  Created by Константин Ирошников on 26.07.2021.
//

import Foundation
import UIKit

protocol NewWordViewControllerProtocol: AnyObject {
	func startData(word: Word?)
	func enabledData(enabledAdd: Bool, enabledMix: Bool)
}

class NewWordViewController: BaseViewController{
    
    var presenter: NewWordPresenterProtocol?
	
	private var button = BaseBlackButton(title: "ДОБАВИТЬ", selector: #selector(buttonAction))
	private var buttonMix = BaseBlackButton(title: "↓↑", selector: #selector(mixButton))
	
	private var rusValueTF = UITextField()
	private var engValueTF = UITextField()
	private var descriptionValueTF = UITextField()
	
    override func viewDidLoad() {
        super.viewDidLoad()

		EnumNotification.UIKeyboardWillShow.subscribeNotific(observer: self, selector: #selector(adjustForKeydoard(notification:)))
        EnumNotification.UIKeyboardWillHide.subscribeNotific(observer: self, selector: #selector(adjustForKeydoard(notification:)))
    }

    override var titleText: String?{
        return "Новое слово"
    }

    override var leftTextBBItem: String?{
        return "Отмена"
    }

    override var leftColor: UIColor{
        return UIColor.red
    }

    @objc override func leftBBItem(){
        presenter?.tapedCancel()
    }

    override func desingUI() {
        view.addSubview(button)
        button.isEnabled = false

        button.snp.makeConstraints({ (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.equalTo(self.view).offset(-20)
            make.height.equalTo(50)
        })
		
		let rusValue = addLabel(text: "Введте русское значение")
		view.addSubview(rusValue)
		rusValue.snp.makeConstraints({ (make) in
			 make.left.equalTo(20)
			 make.right.equalTo(-20)
			 make.top.equalTo(self.view).offset(20)
			 make.height.equalTo(30)
		 })
		
		rusValueTF.settingsTF(placeholder: "RUS", delegateObj: self)
		view.addSubview(rusValueTF)
		rusValueTF.snp.makeConstraints({ (make) in
			make.left.equalTo(20)
			make.right.equalTo(-20)
			make.top.equalTo(rusValue.snp.bottom).offset(10)
			make.height.equalTo(20)
		})
		
        view.addSubview(buttonMix)
        buttonMix.isEnabled = false

        buttonMix.snp.makeConstraints({ (make) in
			make.top.equalTo(rusValueTF.snp.bottom).offset(20)
            make.height.equalTo(50)
			make.width.equalTo(50)
			make.centerX.equalTo(self.view.center.x)
        })
		
		let engValue = addLabel(text: "Введте английское значение")
		view.addSubview(engValue)
		engValue.snp.makeConstraints({ (make) in
			 make.left.equalTo(20)
			 make.right.equalTo(-20)
			make.top.equalTo(buttonMix.snp.bottom).offset(20)
			 make.height.equalTo(30)
		 })
		
		engValueTF.settingsTF(placeholder: "ENG", delegateObj: self)
		view.addSubview(engValueTF)
		engValueTF.snp.makeConstraints({ (make) in
			make.left.equalTo(20)
			make.right.equalTo(-20)
			make.top.equalTo(engValue.snp.bottom).offset(10)
			make.height.equalTo(20)
		})
		
		let description = addLabel(text: "Описание")
		view.addSubview(description)
		description.snp.makeConstraints({ (make) in
			 make.left.equalTo(20)
			 make.right.equalTo(-20)
			 make.top.equalTo(engValueTF.snp.bottom).offset(20)
			 make.height.equalTo(30)
		 })
		
		descriptionValueTF.settingsTF(placeholder: "Описание",
									  returnKeyType: UIReturnKeyType.go,
									  delegateObj: self)
		view.addSubview(descriptionValueTF)
		descriptionValueTF.snp.makeConstraints({ (make) in
			make.left.equalTo(20)
			make.right.equalTo(-20)
			make.top.equalTo(description.snp.bottom).offset(10)
			make.height.equalTo(20)
		})
    }

    @objc private func buttonAction(sender: UIButton!) {
		presenter?.createWord()
    }
	
    @objc private func mixButton(sender: UIButton!) {
		presenter?.tapedMix()
    }
	
	@objc private func adjustForKeydoard(notification: Notification) {
		
	}

    private func addLabel(text: String) -> UILabel {

        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)

        return label
    }

}

extension NewWordViewController: UITextFieldDelegate {
	func textField(_ textField: UITextField,
				   shouldChangeCharactersIn range: NSRange,
				   replacementString string: String) -> Bool {
		
		let str = textField.resultString(string: string, range: range)
		
		switch textField {
		case rusValueTF:
			presenter?.textInTF(rusText: str, engText: nil, description: nil)
		case engValueTF:
			presenter?.textInTF(rusText: nil, engText: str, description: nil)
		case descriptionValueTF:
			presenter?.textInTF(rusText: nil, engText: nil, description: str)
		default:
			break
		}
		
		return true
	}
	
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { //нажатие на кнопку next

		switch textField {
		case rusValueTF:
			engValueTF.resignFirstResponder()
		case engValueTF:
			descriptionValueTF.resignFirstResponder()
		case descriptionValueTF:
			descriptionValueTF.becomeFirstResponder()
		default:
			break
		}

        return false
    }
	
//	func textFieldDidBeginEditing(_ textField: UITextField) {
//		print("----")
//	}
//
//	func textFieldDidEndEditing(_ textField: UITextField) {
//		print("00000")
//	}
//
//	func textFieldDidChangeSelection(_ textField: UITextField) {
//		print("-\\\\\\-")
//	}
}

extension NewWordViewController: NewWordViewControllerProtocol {
	func startData(word: Word?) {
		guard let word = word else { return }
		
		rusValueTF.text = word.rusValue.textEditor
		engValueTF.text = word.engValue.textEditor
		descriptionValueTF.text = word.descript
	}
	
	func enabledData(enabledAdd: Bool, enabledMix: Bool){
		buttonMix.isEnabled = enabledMix
		button.isEnabled = enabledAdd
	}
}


