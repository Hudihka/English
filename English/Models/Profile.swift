//
//  Profile.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import Foundation


struct Profile {

    var lists: [List] = []

    init(json: JSON) {

        if let temp = json["lists"] as? [JSON] {
            let defaultDate = Date(timeIntervalSinceNow: TimeInterval(-1000000000))
            let lists = temp.map { List(json: $0) }.sorted(by: { $0.dateUpdate ?? defaultDate > $1.dateUpdate ?? defaultDate })

            self.lists = lists
        }

    }


    var json: JSON {
        var json: [String : Any] = [:]

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

