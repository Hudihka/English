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

//MARK: - fonts

enum EnumFont: String{
    case bold = "Bold"
    case semibold = "Semibold"
    case regular = "Regular"
    case medium = "Medium"
    case light = "Light"
    
    private var nameFont: String {
        let baseName = "Montserrat-"
        return baseName + self.rawValue
    }
    
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
        let font = UIFont(name: nameFont, size: size)
        return font ?? UIFont.systemFont(ofSize: size, weight: self.wedding)
    }
    
}


