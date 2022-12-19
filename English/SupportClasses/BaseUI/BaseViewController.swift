//
//  BaseViewController.swift
//  English
//
//  Created by Константин Ирошников on 06.07.2021.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    
    var titleText: String?{
        return nil
    }
	
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        self.title = titleText
        
        desingUI()

    }
}
