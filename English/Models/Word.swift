//
//  Word.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import Foundation


struct Word: Equatable {
    
    var id: String?
    var listName: String = ""
    
    var rusValue: String = ""
    var engValue: String = ""
    var descript: String?
    var favorit: Bool = false
    
    
    init(json: [String : Any], id: String?){
        if id == nil {
            self.id = String.randomString
        } else if let temp = json["id"] as? String {
            self.id = temp
        }

        if let temp = json["listName"] as? String {
            self.listName = temp
        }
        
        if let temp = json["rusValue"] as? String {
            self.rusValue = temp
        }
        
        if let temp = json["engValue"] as? String {
            self.engValue = temp
        }
        
        if let temp = json["descript"] as? String,
           let desc = temp.textEditor {
            self.descript = desc
        }

        if let temp = json["favorit"] as? Bool {
            self.favorit = temp
        }
        
    }
    
    
    var json: JSON{
        
        var json: JSON = [:]
        
        if let id = id {
            json["id"] = id
        }
        
        json["listName"]     = listName
        json["rusValue"]     = rusValue
        json["engValue"]     = engValue
        json["descript"]     = descript
        json["favorit"]      = favorit
        
        return json
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        if lhs.listName == rhs.listName,
           lhs.rusValue == rhs.rusValue,
           lhs.engValue == rhs.engValue,
           lhs.descript == rhs.descript,
           lhs.favorit == rhs.favorit {
            return true
        }

        return false
    }
    
}
