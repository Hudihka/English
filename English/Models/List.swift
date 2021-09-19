//
//  List.swift
//  English
//
//  Created by Константин Ирошников on 14.07.2021.
//

import Foundation


struct List {
    
    var name: String = ""
    var count: Int = 0
    var countFavorit: Int = 0
    
    var number: Int = 0

    init(name: String){
        self.name = name
        let oldNumber = FirebaseData.shared.profile?.newNumberList ?? 0
        self.number = oldNumber + 1
    }
    
    init(json: JSON) {
        
        if let temp = json["name"] as? String {
            self.name = temp
        }
        
        if let temp = json["count"] as? Int {
            self.count = temp
        }
        
        if let temp = json["favorit"] as? Int {
            self.countFavorit = temp
        }
        
        if let temp = json["number"] as? Int {
            self.number = temp
        }
        
    }
    

    var json: JSON {
        var json: [String : Any] = [:]
        
        json["name"]            = name
        json["count"]           = count
        json["favorit"]         = countFavorit
        json["number"]          = number
        
        return json
    }
	
	//методы вызываемые когда что либо делаем со словами

    mutating func addOrDeleteOneWord(add: Bool) {
        if add {
            count += 1
        } else if count != 0 {
            count -= 1
        }
    }
    
	
    mutating func jsonReloadFavoritCount(add: Bool){
		
		if add {
			countFavorit += 1
		} else if countFavorit == 0 {
			countFavorit = 0
		} else {
			countFavorit -= 1
		}
	}
}
