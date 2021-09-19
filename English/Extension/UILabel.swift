//
//  UILabel.swift
//  English
//
//  Created by Константин Ирошников on 19.09.2021.
//

import Foundation
import UIKit

extension UILabel {
    static func label(text: String?, font: EnumFont, aligment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.textAlignment = aligment
        label.font = font.font
        label.text = text
        label.textColor = UIColor.black

        return label
    }

    static func label(text: String?, font: EnumFont) -> UILabel {
        let label = UILabel()
        label.font = font.font
        label.text = text
        label.textColor = UIColor.black

        return label
    }

    static func labelInfinity(text: String?, font: EnumFont, aligment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.textAlignment = aligment
        label.font = font.font
        label.text = text
        label.numberOfLines = 0
        label.textColor = UIColor.black

        return label
    }

    static func labelInfinity(text: String?, font: EnumFont) -> UILabel {
        let label = UILabel()
        label.font = font.font
        label.text = text
        label.numberOfLines = 0
        label.textColor = UIColor.black

        return label
    }
}
