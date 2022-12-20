//
//  NSObject.swift
//  English
//
//  Created by Константин Ирошников on 15.07.2021.
//

import Foundation

extension NSObject {
    static var className: String {
        String(describing: self)
    }
}
