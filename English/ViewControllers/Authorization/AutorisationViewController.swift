//
//  AutorisationViewController.swift
//  English
//
//  Created by Константин Ирошников on 10.07.2021.
//

import Foundation

protocol AutorisationViewControllerIn: AnyObject {
    func resultLoadProfile(error: Error)
}

class AutorisationViewController: BaseViewController, AutorisationViewControllerIn {
    
    var presenter: AutorisationPresenter?
    
    override func desingUI() {
        super.desingUI()
        
        let button = UIButton()
        button.setTitle("ВХОД", for: .normal)
        button.backgroundColor = UIColor.black
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.addRadius(number: 5)
        
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

