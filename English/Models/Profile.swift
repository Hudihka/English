//
//  Profile.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import Foundation


class Profile {
    
    var id = "id223"
    var lists: [String] = []
    
    init(id: String) {
        self.id = id
    }
    
    init(json: JSON) {
        
        if let temp = json["id"] as? String {
            self.id = temp
        }
        
        if let temp = json["lists"] as? [String] {
            self.lists = temp
        }
        
    }
    

    var json: JSON {
        var json: [String : Any] = ["id" : self.id]
        
        json["lists"]        = self.lists
        
        return json
    }
    
}
