//
//  MenuViewController.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import UIKit

protocol MenuViewControllerIn: AnyObject {
    func resultLoadProfile(error: Error)
}

class MenuViewController: BaseViewController, MenuViewControllerIn {
    
    var presenter: MenuPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var titleText: String?{
        return "TEST"
    }

}
