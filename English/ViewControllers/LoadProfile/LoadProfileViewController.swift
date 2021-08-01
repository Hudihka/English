//
//  LoadProfileViewController.swift
//  English
//
//  Created by Константин Ирошников on 06.07.2021.
//

import UIKit

protocol LoadProfileViewControllerProtocol: AnyObject {
    func resultLoadProfile(error: Error)
}

class LoadProfileViewController: BaseViewController, LoadProfileViewControllerProtocol {
    
    var presenter: LoadProfilePresenter?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        presenter?.didLoadVC()
    }
    
    override func desingUI() {
        super.desingUI()
        
        let label = UILabel()
        label.text = "Учение - свет, неученье - тьма\nТьма - это мать, это мать, мать его..."
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .left
        self.view.addSubview(label)
        
        label.snp.makeConstraints({ (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.centerY.equalTo(self.view).offset(10)
            make.centerX.equalTo(self.view)
            make.height.equalTo(120)
        })
    }
    
    func resultLoadProfile(error: Error){
        self.showAlertError(error: error)
    }

}
