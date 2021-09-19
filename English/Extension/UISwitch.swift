//
//  UISwitch.swift
//  English
//
//  Created by Константин Ирошников on 19.09.2021.
//

import Foundation
import UIKit

extension UISwitch {

    func setingsSwitch(_ target: Any?, action: Selector) {
        self.onTintColor = UIColor.black
        self.tintColor = grayColor
        self.addTarget(target, action: action, for: .touchUpInside)
    }
}
