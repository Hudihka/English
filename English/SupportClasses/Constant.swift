//
//  Constant.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import Foundation
import UIKit

typealias JSON = [String : Any]

let hDdevice = UIScreen.main.bounds.size.height
let wDdevice = UIScreen.main.bounds.size.width

let FAVORIT_NAME = "ФАВОРИТ"
let FAVORIT_COUNT = 1
let TEST_COUNT = 10

let grayColor = UIColor(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1)

//MARK: - fonts

enum EnumFont {
    case bold(CGFloat)
    case semibold(CGFloat)
    case regular(CGFloat)
    case medium(CGFloat)
    case light(CGFloat)

    private var wedding: UIFont.Weight {

        switch self {
        case .bold:
            return UIFont.Weight.bold
        case .semibold:
            return UIFont.Weight.semibold
        case .regular:
            return UIFont.Weight.regular
        case .medium:
            return UIFont.Weight.medium
        case .light:
            return UIFont.Weight.light
        }
    }

    var font: UIFont {
        switch self {
        case .bold(let size):
            return UIFont.systemFont(ofSize: size, weight: wedding)
        case .semibold(let size):
            return UIFont.systemFont(ofSize: size, weight: wedding)
        case .regular(let size):
            return UIFont.systemFont(ofSize: size, weight: wedding)
        case .medium(let size):
            return UIFont.systemFont(ofSize: size, weight: wedding)
        case .light(let size):
            return UIFont.systemFont(ofSize: size, weight: wedding)
        }
    }

}
