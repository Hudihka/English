//
//  DI.swift
//  English
//
//  Created by Константин Ирошников on 10.07.2021.
//

import Foundation


protocol DIProtocol: AnyObject {
    static func loadProfileViewController() -> BaseViewController
    static func menuViewController() -> BaseViewController
}
