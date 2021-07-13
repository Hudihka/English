//
//  Word.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import Foundation


struct Word: Equatable {
    
    var id: String?
    var listId: String = ""
    
    var rusValue: String = ""
    var engValue: String = ""
    var descript: String?
    var favorit: Bool = false
    
    
    init(json: [String : Any], id: String?){
        self.id = id
        
        
        if let temp = json["listId"] as? String {
            self.listId = temp
        }
        
        if let temp = json["rusValue"] as? String {
            self.rusValue = temp
        }
        
        if let temp = json["engValue"] as? String {
            self.engValue = temp
        }
        
        if let temp = json["descript"] as? String {
            self.descript = temp
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
        
        json["listId"]       = listId
        json["rusValue"]     = rusValue
        json["engValue"]     = engValue
        json["descript"]     = descript
        json["favorit"]      = favorit
        
        return json
    }

    
}
