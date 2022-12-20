//
//  Word.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import Foundation

struct Word {
    let trans: String
    let form1: String
    let form2: String
    let form3: String
    
    var isFavorit: Bool = false
    
    init(json: JSON){
        self.trans = (json["trans"] as? String) ?? "-"
        self.form1 = (json["form1"] as? String) ?? "-"
        self.form2 = (json["form2"] as? String) ?? "-"
        self.form3 = (json["form3"] as? String) ?? "-"
        
        self.isFavorit = DefaultUtils.shared.getFavoritValueWord(id: self.key)
    }
}

extension Word {
    static func generateArray(json: [JSON]) -> [Word] {
        json.map({ Word(json: $0) }).sorted(by: { $0.form1 > $1.form1 })
    }
    
    var key: String {
        "\(trans)_\(form1)_\(form2)_\(form3)"
    }
}
