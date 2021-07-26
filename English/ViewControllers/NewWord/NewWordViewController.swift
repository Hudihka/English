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

        // Do any additional setup after loading the view.
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
        self.view.addSubview(button)

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
    }

    @objc private func buttonAction(sender: UIButton!) {

    }
	
    @objc private func mixButton(sender: UIButton!) {

    }

    private func addLabel(text: String) -> UILabel {

        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)

        return label
    }

}

extension NewWordViewController: UITextFieldDelegate {
	
}

extension NewWordViewController: NewWordViewControllerProtocol {
	func startData(word: Word?) {
		guard let word = word else { return }
		
		
	}
}


