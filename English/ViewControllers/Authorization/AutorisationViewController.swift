//
//  AutorisationViewController.swift
//  English
//
//  Created by Константин Ирошников on 10.07.2021.
//

import Foundation
import UIKit

protocol AutorisationViewControllerProtocol: AnyObject {
    func resultLoadProfile(error: Error)
}

class AutorisationViewController: BaseViewController, AutorisationViewControllerProtocol {
    
    var presenter: AutorisationPresenter?
    lazy var button = BaseBlackButton(title: "ВХОД", selector: #selector(buttonAction), target: self)
    
    override func desingUI() {
        super.desingUI()
        
        self.view.addSubview(button)
        
        button.snp.makeConstraints({ (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.centerY.equalTo(self.view).offset(10)
            make.centerX.equalTo(self.view)
            make.height.equalTo(50)
        })
    }
    
    @objc private func buttonAction(sender: UIButton!) {
        presenter?.autoriz()
     }
    
    
    func resultLoadProfile(error: Error) {
        self.showAlertError(error: error)
    }
    
}

