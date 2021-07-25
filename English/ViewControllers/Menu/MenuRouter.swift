//
//  MenuRouter.swift
//  English
//
//  Created by Константин Ирошников on 14.07.2021.
//

import Foundation
import UIKit

protocol MenuRouterProtocol: AnyObject {
    func presentSplit(words: [Word], way: MenuEndpointsEnum.ActionButtonsAlert)
    func pushCramming(words: [Word], listName: String)
    func newWordInTheme(listName: String)

    init(navigationVC: UINavigationController)
}

class MenuRouter: MenuRouterProtocol{
    private let navigationVC: UINavigationController!

    required init(navigationVC: UINavigationController){
        self.navigationVC = navigationVC
    }

    func presentSplit(words: [Word], way: MenuEndpointsEnum.ActionButtonsAlert) {

    }

    func pushCramming(words: [Word], listName: String) {
    }

    func newWordInTheme(listName: String) {
        let NVC = DI.newWordViewController(nameList: listName)
        navigationVC.present(NVC, animated: true, completion: nil)
    }
}
