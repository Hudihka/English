//
//  NewWordViewController.swift
//  English
//
//  Created by Константин Ирошников on 26.07.2021.
//

import Foundation
import UIKit

protocol NewWordViewControllerProtocol: AnyObject {
}

class NewWordViewController: BaseViewController {

    lazy var button = BaseBlackButton(title: "ДОБАВИТЬ", selector: #selector(buttonAction))
    
    var presenter: NewWordPresenterProtocol?

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
    }

    @objc private func buttonAction(sender: UIButton!) {

    }

    private func addLabel(text: String) -> UILabel {

        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)

        return label
    }

}


extension NewWordViewController: NewWordViewControllerProtocol {
}
