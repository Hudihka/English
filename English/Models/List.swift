//
//  List.swift
//  English
//
//  Created by Константин Ирошников on 14.07.2021.
//

import Foundation


class List {
    
    var id = "id223"
    var name: String?
    var count: Int = 0
    var countFavorit: Int = 0
    
    var dateUpdate: Date = Date()
    
    init(json: JSON) {
        
        if let temp = json["id"] as? String {
            self.id = temp
        }
        
        if let temp = json["name"] as? String {
            self.name = temp
        }
        
        if let temp = json["count"] as? Int {
            self.count = temp
        }
        
        if let temp = json["countFavorit"] as? Int {
            self.countFavorit = temp
        }
        
        if let temp = json["dateUpdate"] as? String, let date = temp.getDatwToString() {
            self.dateUpdate = date
        }
        
    }
    

    var json: JSON {
        var json: [String : Any] = ["id" : self.id]
        
        json["name"]            = name
        json["count"]           = count
        json["countFavorit"]    = countFavorit
        json["dateUpdate"]      = dateUpdate.printDate()
        
        return json
    }
    
    var isFavoritList: Bool {
        if let name = name {
            return name == FAVORIT_NAME
        }
        
        return false
    }
    
}
