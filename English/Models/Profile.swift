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
            let lists = temp.map { List(json: $0) }.sorted(by: { $0.dateUpdate > $1.dateUpdate })
            
            self.lists = lists
        }
        
    }
    

    var json: JSON {
        var json: [String : Any] = ["id" : self.id]
        
        json["lists"]        = self.lists.map({$0.json})
        
        return json
    }
    
    var countFavorit: Int {
        let count = lists.reduce(0, {$0 + $1.countFavorit})
        return Int(count)
    }
    
    var countWords: Int {
        let count = lists.reduce(0, {$0 + $1.count})
        return count
    }
    
}
