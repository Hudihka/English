//
//  DI.swift
//  English
//
//  Created by Константин Ирошников on 10.07.2021.
//

import Foundation
import UIKit

protocol DIProtocol: AnyObject {
    static func loadProfileViewController() -> BaseViewController
    static func autorisationViewController() -> BaseViewController

    static func menuViewController() -> BaseNavigationController
    static func newWordViewController(list: List, oldWord: Word?) -> BaseNavigationController
    static func wordsViewController(list: List?, NVC: BaseNavigationController) -> BaseViewController

    static func splitViewController(list: List?, wayTranslate: MenuEndpointsEnum.ActionButtonsAlert) -> SplitViewController
    static func masterSplitViewController(SVC: UIViewController) -> (NVC: BaseNavigationController, interactor: MasterSplitInteractorProtocol)
    static func detailSplitViewController(SVC: UIViewController) -> (NVC: BaseNavigationController, interactor: DetailSplitInteractorProtocol)

    static func searchViewController() -> BaseNavigationController
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

        let presenter = NewWordPresenter(oldWord: oldWord,
                                         list: list,
                                         isBeginHide: oldWord != nil)
        let interactor = NewWordInteractor()
        let router = NewWordRouter(navigationVC: NVC)

        VC.presenter = presenter
        interactor.presenter = presenter

        presenter.view = VC
        presenter.interactor = interactor
        presenter.router = router

        return NVC
    }

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

    static func splitViewController(list: List?,
                                    wayTranslate: MenuEndpointsEnum.ActionButtonsAlert) -> SplitViewController {
        let VC = SplitViewController()

        let interactor = SplitInteractor(list: list)
        let presenter = SplitPresenter(interactor: interactor, wayTranslate: wayTranslate)

        VC.presenter = presenter
        interactor.presenter = presenter

        presenter.view = VC
        presenter.interactor = interactor

        return VC
    }

    static func masterSplitViewController(SVC: UIViewController) -> (NVC: BaseNavigationController, interactor: MasterSplitInteractorProtocol) {
        let VC = MasterSplitViewController()
        let NVC = BaseNavigationController(rootViewController: VC)

        let interactor = MasterSplitInteractor()
        let router = MasterSplitRouter(SVC: SVC)
        let presenter = MasterSplitPresenter()

        VC.presenter = presenter
        interactor.presenter = presenter

        presenter.view = VC
        presenter.interactor = interactor
        presenter.router = router

        return (NVC: NVC, interactor: interactor)
    }

    static func detailSplitViewController(SVC: UIViewController) -> (NVC: BaseNavigationController, interactor: DetailSplitInteractorProtocol) {
        let VC = DetailSplitViewController()
        let NVC = BaseNavigationController(rootViewController: VC)

        let interactor = DetailSplitInteractor()
        let router = DetailSplitRouter(SVC: SVC)
        let presenter = DetailSplitPresenter()

        VC.presenter = presenter
        interactor.presenter = presenter

        presenter.view = VC
        presenter.interactor = interactor
        presenter.router = router

        return (NVC: NVC, interactor: interactor)
    }

    static func searchViewController() -> BaseNavigationController {
        let VC = SearchViewController()
        let NVC = BaseNavigationController(rootViewController: VC)

        let interactor = SearchInteractor()
        let presenter = SearchPresenter()
        let router = SearchRouter(navigationVC: NVC)

        VC.presenter = presenter
        interactor.presenter = presenter

        presenter.view = VC
        presenter.interactor = interactor
        presenter.router = router

        return NVC
    }

}

