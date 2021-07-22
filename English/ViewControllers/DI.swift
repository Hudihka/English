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
        let presenter = MenuPresenter()
        let interactor = MenuInteractor()
        let router = MenuRouterProtocol()
        
        VC.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = VC
        presenter.interactor = interactor
        presenter.router = router
        
        let NVC = BaseNavigationController(rootViewController: VC)
        
        return NVC
    }
    
}
