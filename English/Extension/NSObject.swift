//
//  NSObject.swift
//  English
//
//  Created by Константин Ирошников on 15.07.2021.
//

import Foundation

extension NSObject {
    var className: String {
        return NSStringFromClass(type(of: self))
    }
}
