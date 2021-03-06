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
	func enabledData(enabledAdd: Bool,
                     enabledMix: Bool)
    func enableCopy(enableCopyTop: Bool,
                    enableCopyBottom: Bool)

    func title(text: String)
    func titleButton(text: String)
    func isHidenBeginButton(isHiden: Bool)

    func blockedButton(tag: Int)
}

class NewWordViewController: BaseViewController{
    
    var presenter: NewWordPresenterProtocol?

    private let buttonAddAndNext = BaseBlackButton(title: NewWordEndpoits.ButtonText.addAndNext.rawValue,
                                                   selector: #selector(buttonActionAddAndNext), target: self)
    private let buttonAdd = BaseBlackButton(title: nil,
                                         selector: #selector(buttonAction), target: self)
    private let buttonMix = BaseBlackButton(title: NewWordEndpoits.ButtonText.mix.rawValue,
                                            selector: #selector(mixButton), target: self)
    private let topCopy = CopyButton(selector: #selector(copyTap),
                                     target: self)
    private let bottomCopy = CopyButton(selector: #selector(copyTap),
                                        target: self)

    private var gester: UITapGestureRecognizer?
	
	private var rusValueTF = UITextField()
	private var engValueTF = UITextField()
	private var descriptionValueTF = UITextField()
	
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override var leftTextBBItem: String?{
        return NewWordEndpoits.ButtonText.leftBB.rawValue
    }

    override var leftColor: UIColor{
        return UIColor.red
    }

    @objc override func leftBBItem(){
        presenter?.tapedCancel()
    }

    override func desingUI() {
        view.addSubview(buttonAdd)
        buttonAdd.isEnabled = false

        buttonAdd.snp.makeConstraints({ (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.equalTo(self.view).offset(-20)
            make.height.equalTo(50)
        })
		
        let rusValue = addLabel(text: NewWordEndpoits.Labels.rus)
		view.addSubview(rusValue)
		rusValue.snp.makeConstraints({ (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.height.equalTo(30)
		 })
		
        rusValueTF.settingsTF(placeholder: NewWordEndpoits.TextField.rus.rawValue, delegateObj: self)
		view.addSubview(rusValueTF)
		rusValueTF.snp.makeConstraints({ (make) in
			make.left.equalTo(20)
			make.right.equalTo(-20)
			make.top.equalTo(rusValue.snp.bottom).offset(10)
			make.height.equalTo(30)
		})

        topCopy.tag = 0
        view.addSubview(topCopy)
        topCopy.snp.makeConstraints({ (make) in
            make.top.equalTo(rusValue.snp.top)
            make.right.equalTo(rusValueTF.snp.right)
            make.bottom.equalTo(rusValue.snp.bottom)
            make.width.equalTo(75)
         })
		
        view.addSubview(buttonMix)
        buttonMix.isEnabled = false

        buttonMix.snp.makeConstraints({ (make) in
			make.top.equalTo(rusValueTF.snp.bottom).offset(20)
            make.height.equalTo(50)
			make.width.equalTo(50)
			make.centerX.equalTo(self.view.center.x)
        })
		
		let engValue = addLabel(text: NewWordEndpoits.Labels.engl)
		view.addSubview(engValue)
		engValue.snp.makeConstraints({ (make) in
			 make.left.equalTo(20)
			 make.right.equalTo(-20)
			make.top.equalTo(buttonMix.snp.bottom).offset(20)
			 make.height.equalTo(30)
		 })
		
        engValueTF.settingsTF(placeholder: NewWordEndpoits.TextField.engl.rawValue, delegateObj: self)
		view.addSubview(engValueTF)
		engValueTF.snp.makeConstraints({ (make) in
			make.left.equalTo(20)
			make.right.equalTo(-20)
			make.top.equalTo(engValue.snp.bottom).offset(10)
			make.height.equalTo(30)
		})

        bottomCopy.tag = 1
        view.addSubview(bottomCopy)
        bottomCopy.snp.makeConstraints({ (make) in
            make.top.equalTo(engValue.snp.top)
            make.right.equalTo(engValueTF.snp.right)
            make.bottom.equalTo(engValue.snp.bottom)
            make.width.equalTo(75)
         })
		
        let description = addLabel(text: NewWordEndpoits.Labels.descript)
		view.addSubview(description)
		description.snp.makeConstraints({ (make) in
			 make.left.equalTo(20)
			 make.right.equalTo(-20)
			 make.top.equalTo(engValueTF.snp.bottom).offset(20)
			 make.height.equalTo(30)
		 })
		
        descriptionValueTF.settingsTF(placeholder: NewWordEndpoits.TextField.descript.rawValue,
									  returnKeyType: UIReturnKeyType.go,
									  delegateObj: self)
		view.addSubview(descriptionValueTF)
		descriptionValueTF.snp.makeConstraints({ (make) in
			make.left.equalTo(20)
			make.right.equalTo(-20)
			make.top.equalTo(description.snp.bottom).offset(10)
			make.height.equalTo(30)
		})

        view.addSubview(buttonAddAndNext)
        buttonAddAndNext.isEnabled = false

        buttonAddAndNext.snp.makeConstraints({ (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(descriptionValueTF.snp.bottom).offset(30)
            make.height.equalTo(50)
        })

        gester = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        self.view.addGestureRecognizer(gester!)
        gester?.isEnabled = false

        presenter?.fetchTitle()
        presenter?.fetchData()
    }

//    private func labelCopy() {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
//        label.text = "СКОПИРОВАНО"
//        label.backgroundColor = .black
//        label.textColor = .white
//        label.addRadius(number: 2)
//
//        view.addSubview(label)
//
//        label.snp.makeConstraints({ (make) in
//            make.left.equalTo(view.snp.left).offset(-5)
//            make.top.equalTo(view.snp.top).offset(1)
//            make.height.equalTo(19)
//            make.width.equalTo(40)
//        })
//
//        UIView.animate(withDuration: 0.3) {
//            label.snp.makeConstraints({ (make) in
//                make.left.equalTo(self.view.snp.right).offset(5)
//            })
//        } completion: { compl in
//            if compl {
//                label.removeFromSuperview()
//            }
//        }
//    }

    @objc private func buttonActionAddAndNext(sender: UIButton!) {
        presenter?.createAndAddWord()
        rusValueTF.becomeFirstResponder()
    }

    @objc private func buttonAction(sender: UIButton!) {
		presenter?.createWord()
    }
	
    @objc private func mixButton(sender: UIButton!) {
		presenter?.tapedMix()
    }

    @objc private func copyTap(sender: UIButton!) {
//        labelCopy()
        presenter?.copyText(tag: sender.tag)
    }

    @objc private func handleTap(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
	
    @objc override func adjustForKeydoard(notification: Notification) {
        if notification.name == UIApplication.keyboardWillShowNotification {
            gester?.isEnabled = true
        } else if notification.name == UIApplication.keyboardWillHideNotification {
            gester?.isEnabled = false
        }
	}

    private func addLabel(text: NewWordEndpoits.Labels) -> UILabel {

        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.text = text.rawValue

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
			engValueTF.becomeFirstResponder()
		case engValueTF:
			descriptionValueTF.becomeFirstResponder()
		case descriptionValueTF:
			descriptionValueTF.resignFirstResponder()
		default:
			break
		}

        return false
    }
}

extension NewWordViewController: NewWordViewControllerProtocol {
	func startData(word: Word?) {
        let topText = word?.rusValue.textEditor
        let botomText = word?.engValue.textEditor
		
        rusValueTF.text = topText
		engValueTF.text = botomText

		descriptionValueTF.text = word?.descript
	}
	
	func enabledData(enabledAdd: Bool,
                     enabledMix: Bool){
		buttonMix.isEnabled        = enabledMix
        buttonAdd.isEnabled        = enabledAdd
        buttonAddAndNext.isEnabled = enabledAdd
	}

    func enableCopy(enableCopyTop: Bool,
                    enableCopyBottom: Bool) {
        topCopy.isEnabled = enableCopyTop
        bottomCopy.isEnabled = enableCopyBottom
    }

    func title(text: String){
        self.title = text
    }

    func titleButton(text: String) {
        buttonAdd.setTitle(text, for: .normal)
    }

    func isHidenBeginButton(isHiden: Bool){
        buttonAddAndNext.isHidden = isHiden
    }

    func blockedButton(tag: Int) {
        if topCopy.tag == tag {
            topCopy.isEnabled = false
        }
        if bottomCopy.tag == tag {
            bottomCopy.isEnabled = false
        }
    }
}


