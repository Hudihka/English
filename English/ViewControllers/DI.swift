//
//  DI.swift
//  English
//
//  Created by Константин Ирошников on 10.07.2021.
//

import Foundation
import UIKit

protocol DIProtocol: AnyObject {
    static func wordsViewController() -> BaseNavigationController
}


class DI: DIProtocol {
    static func wordsViewController() -> BaseNavigationController {
        let VC = WordsViewController()
        let VM = WordsViewModel()
        VC.VM = VM
        
        return BaseNavigationController(rootViewController: VC)
    }
}

