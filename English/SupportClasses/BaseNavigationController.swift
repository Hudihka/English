//
//  BaseNavigationController.swift
//  English
//
//  Created by Константин Ирошников on 06.07.2021.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.clearBar()
        self.fontBar(font: EnumFont.bold.font(21), color: .black)
    }
    

}
