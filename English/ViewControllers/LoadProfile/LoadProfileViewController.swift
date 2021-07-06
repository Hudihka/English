//
//  LoadProfileViewController.swift
//  English
//
//  Created by Константин Ирошников on 06.07.2021.
//

import UIKit

class LoadProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
    }
    
    override func desingUI() {
        super.desingUI()
        
        let label = UILabel()
        label.text = "Учение - свет, неученье - тьма\nТьма - это мать, это мать, мать его..."
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .left
        self.view.addSubview(label)
        
        label.snp.makeConstraints({ (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.centerX.equalTo(self.view)
            make.height.greaterThanOrEqualTo(90)
        })
    }
    
    

}
