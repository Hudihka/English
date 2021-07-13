//
//  RouterProtocol.swift
//  English
//
//  Created by Константин Ирошников on 10.07.2021.
//

import Foundation
import UIKit

protocol RouterProtocol: AnyObject {
    @optional var callBack: (() -> ())? {get set}
    @optional var callBackParametrs: ((Any) -> ())? {get set}
    
    @optional func present()
    @optional func push()
    @optional func windowChange()
}
