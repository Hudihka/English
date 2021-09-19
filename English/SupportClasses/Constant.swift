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

enum EnumFont: String{
    case bold = "Bold"
    case semibold = "Semibold"
    case regular = "Regular"
    case medium = "Medium"
    case light = "Light"
    
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
    
    func font(_ size: CGFloat) -> UIFont {
        let font = UIFont.systemFont(ofSize: size, weight: wedding)
        return font
    }
    
}


