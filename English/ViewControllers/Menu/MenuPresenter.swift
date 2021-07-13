//
//  LoadProfilePresenter.swift
//  English
//
//  Created by Константин Ирошников on 08.07.2021.
//

import Foundation


protocol MenuPresenterIn: AnyObject {
}

class MenuPresenter: MenuPresenterIn {
    
    var interactor: MenuInteractorIn?
    var router: RouterProtocol?
    weak var view: MenuViewControllerIn?
    
    
}


