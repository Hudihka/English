//
//  RouterProtocol.swift
//  English
//
//  Created by Константин Ирошников on 10.07.2021.
//

import Foundation

protocol RouterProtocol: AnyObject {
    var callBack: (() -> ())? {get set}
    var callBackParametrs: ((Any) -> ())? {get set}
    
    func present()
    func push()
    func windowChange()
}
