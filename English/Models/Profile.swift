//
//  Profile.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import Foundation


class Profile {
    
    var id = "id223"
    var lists: [List] = []
    
    init(id: String) {
        self.id = id
    }
    
    init(json: JSON) {
        
        if let temp = json["id"] as? String {
            self.id = temp
        }
        
        if let temp = json["lists"] as? [JSON] {
            var lists = temp.map { List(json: $0) }
            lists = lists.sorted(by: { list1, list2 in
                
                if list1.name == FAVORIT_NAME {
                    return true
                }
                
                return list1.dateUpdate > list2.dateUpdate
            })
            
            self.lists = lists
        }
        
    }
    

    var json: JSON {
        var json: [String : Any] = ["id" : self.id]
        
        json["lists"]        = self.lists.map({$0.json})
        
        return json
    }
    
}
