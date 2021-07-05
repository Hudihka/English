//
//  MenuViewController.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    static func route() -> MenuViewController {
        let storuboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storuboard.instantiateViewController(identifier: "MenuViewController") as! MenuViewController
        
        return VC
    }

}
