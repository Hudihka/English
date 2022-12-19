//
//  DI.swift
//  English
//
//  Created by Константин Ирошников on 10.07.2021.
//

import Foundation
import UIKit

protocol DIProtocol: AnyObject {
    static func wordsViewController(list: List?, NVC: BaseNavigationController) -> BaseViewController
}


class DI: DIProtocol {
    static func wordsViewController(list: List?, NVC: BaseNavigationController) -> BaseViewController {
        let VC = WordsViewController()

        let interactor = WordsInteractor(list: list)
        let router = WordsRouter(navigationVC: NVC, list: list)
        let presenter = WordsPresenter(interactor: interactor)

        VC.presenter = presenter
        interactor.presenter = presenter

        presenter.view = VC
        presenter.interactor = interactor
        presenter.router = router

        return VC
    }
}

