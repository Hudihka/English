//
//  String.swift
//  English
//
//  Created by Константин Ирошников on 14.07.2021.
//

import Foundation

extension String {
    
    func deleteSumbol(sumbol: String) -> String {
        var str = ""
        self.components(separatedBy: sumbol).forEach { (obj) in
            str += obj
        }

        return str
    }

    var textEditor: String? { //удаляе с конца строки пробелы
        var text = self
        while text.last == "\n" || text.last == " " {
            if !text.isEmpty {
                text.removeLast()
            }
        }

        return text == "" ? nil : text
    }
    
    
    func getDatwToString(_ formater: String = "yyyy-MM-dd HH:mm:ssZ") -> Date? { //переобраз строку в дату
        //2019-06-07 07:56:17+00

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formater

        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: self) // replace Date String
    }

    static var randomString: String {
          let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
          return String((0..<20).map{ _ in letters.randomElement()! })
    }
    
}
