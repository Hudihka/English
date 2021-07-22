//
//  MenuRouter.swift
//  English
//
//  Created by Константин Ирошников on 14.07.2021.
//

import Foundation

protocol MenuRouterProtocol: RouterProtocol {
    var way: MenuEndpointsEnum.ActionButtonsAlert? {get set}
    var words: [Word] {get set}
}

class MenuRouter: MenuRouterProtocol{
    var way: MenuEndpointsEnum.ActionButtonsAlert? = nil

    var words: [Word] = []

    var callBack: (() -> ())? = nil
    
    var callBackParametrs: ((Any) -> ())? = nil
    
    func present() {}
    
    func push() {}
    
    func windowChange() {}
}
