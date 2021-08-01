//
//  List.swift
//  English
//
//  Created by Константин Ирошников on 14.07.2021.
//

import Foundation


class List {
    
    var name: String = ""
    var count: Int = 0
    var countFavorit: Int = 0
    
    var dateUpdate: Date = Date()

    init(name: String){
        self.name = name
		self.dateUpdate = Date()
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
        
        if let temp = json["dateUpdate"] as? String, let date = temp.getDatwToString() {
            self.dateUpdate = date
        }
        
    }
    

    var json: JSON {
        var json: [String : Any] = [:]
        
        json["name"]            = name
        json["count"]           = count
        json["favorit"]         = countFavorit
        json["dateUpdate"]      = Date().printDate()
        
        return json
    }
	
	//методы вызываемые когда что либо делаем со словами

    var jsonAddOneWord: List{
        let newList = self
        newList.dateUpdate = Date()
        newList.count += 1
        return newList
    }
    
	
	func jsonReloadFavoritCount(add: Bool) -> List{
		let newList = self
		let oldCountFavorit = newList.countFavorit
		
		if add {
			newList.countFavorit += 1
		} else if oldCountFavorit == 0 {
			newList.countFavorit = 0
		} else {
			newList.countFavorit -= 1
		}
		
		return newList
	}
}
