//
//  Theme.swift
//  English
//
//  Created by Константин Ирошников on 06.07.2021.
//

import Foundation


struct Theme: Equatable {
    
    var id: String?
    
    var name: String = ""
    var words: [Word] = []
    var countFavorit = 0
    var created: Date = Date()
    
    
    init(json: JSON, id: String?){
        self.id = id
        
        if let temp = json["name"] as? String {
            self.name = temp
        }
        
        if let temp = json["words"] as? [JSON] {
            self.words = Word.createWords(jsons: temp)
            self.countFavorit = self.words.filter({$0.favorit == true}).count
        }
        
        if let temp = json["created"] as? String, let date = temp.getDatwToString() {
            self.created = date
        }
        
    }
    
    var json: JSON{
        
        var json: JSON = [:]
        
        if let id = id {
            json["id"] = id
        }
        
        json["name"]        = name
        json["rusValue"]    = rusValue
        json["engValue"]    = engValue
        json["descript"]    = descript
        json["favorit"]     = favorit
        
        return json
    }

    
}
