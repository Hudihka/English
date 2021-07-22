//
//  MenuRouter.swift
//  English
//
//  Created by Константин Ирошников on 14.07.2021.
//

import Foundation

protocol MenuRouterProtocol: AnyObject {
    func createdNewList(name: String)
}

class MenuRouter: RouterProtocol{
    var callBack: (() -> ())? = nil
    
    var callBackParametrs: ((Any) -> ())? = nil
    
    func present() {}
    
    func push() {}
    
    func windowChange() {}
}
