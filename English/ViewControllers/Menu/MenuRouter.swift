//
//  MenuRouter.swift
//  English
//
//  Created by Константин Ирошников on 14.07.2021.
//

import Foundation

protocol MenuRouterProtocol: AnyObject {
    var tupeNewVC: MenuEndpointsEnum.ActionButtonsAlert? {get set}
    var selectedWords: [Word] {get set}
    func present()

    func push()

}

class MenuRouter: MenuRouterProtocol{

    var tupeNewVC: MenuEndpointsEnum.ActionButtonsAlert?
    var selectedWords: [Word] = []{
        didSet{

        }
    }
    
    func present() {}
    
    func push() {}
}
