//
//  Date.swift
//  English
//
//  Created by Константин Ирошников on 14.07.2021.
//

import Foundation

extension Date {
    
    var hour: Int? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let str = dateFormatter.string(from: self)
        return Int(str)
    }
    
    func printDate(format: String = "yyyy-MM-dd HH:mm:ssZ") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter.string(from: self)
    }

}
