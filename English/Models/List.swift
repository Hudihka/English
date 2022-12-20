//
//  List.swift
//  English
//
//  Created by Константин Ирошников on 14.07.2021.
//

import Foundation

struct List {
    
    let number: Int
    let description: String
    var words: [Word]

    init(json: JSON) {
        self.number = (json["number"] as? Int) ?? 0
		self.description = (json["description"] as? String) ?? "-"
        
        let array = (json["array"] as? [JSON]) ?? []
        self.words = Word.generateArray(json: array)
    }
}

extension List {
    static func generateListsArray(json: [JSON]) -> [List] {
        json.map({ List(json: $0) }).sorted(by: { $0.number > $1.number })
    }
}
