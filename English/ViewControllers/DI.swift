//
//  DI.swift
//  English
//
//  Created by Константин Ирошников on 10.07.2021.
//

import Foundation


protocol DIProtocol: AnyObject {
    static func loadProfileViewController() -> BaseViewController
    static func autorisationViewController() -> BaseViewController
    
    static func menuViewController() -> BaseNavigationController
    static func newWordViewController(list: List, oldWord: Word?) -> BaseNavigationController
//    static func wordsViewController(list: List) -> BaseViewController
}


class DI: DIProtocol {
    static func loadProfileViewController() -> BaseViewController {
        
        let VC = LoadProfileViewController()
        let presenter = LoadProfilePresenter()
        let interactor = LoadProfileInteractor()
        let router = LoadProfileRouter()
        
        VC.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = VC
        presenter.interactor = interactor
        presenter.router = router
        
        return VC
    }
    
    static func autorisationViewController() -> BaseViewController{
        
        let VC = AutorisationViewController()
        let presenter = AutorisationPresenter()
        let interactor = AutorisationInteractor()
        let router = AutorisationRouter()
        
        VC.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = VC
        presenter.interactor = interactor
        presenter.router = router
        
        return VC
    }
    
    static func menuViewController() -> BaseNavigationController {
        let VC = MenuViewController()
        let NVC = BaseNavigationController(rootViewController: VC)

        let presenter = MenuPresenter()
        let interactor = MenuInteractor(presenter: presenter)
        let router = MenuRouter(navigationVC: NVC)
        
        VC.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = VC
        presenter.interactor = interactor
        presenter.router = router
        
        return NVC
    }

	static func newWordViewController(list: List,
									  oldWord: Word?) -> BaseNavigationController {
        let VC = NewWordViewController()
        let NVC = BaseNavigationController(rootViewController: VC)

        let presenter = NewWordPresenter(oldWord: oldWord, list: list)
        let interactor = NewWordInteractor()
        let router = NewWordRouter(navigationVC: NVC)

        VC.presenter = presenter
        interactor.presenter = presenter

        presenter.view = VC
        presenter.interactor = interactor
        presenter.router = router

        return NVC
    }

    static func wordsViewController(list: List) -> BaseViewController {
        
    }
    
}
