//
//  WordsEndpoint.swift
//  English
//
//  Created by Константин Ирошников on 01.08.2021.
//

import Foundation

enum WordsEndpoint {

    enum Segment: String {
        case all                = "Все"
        case onlyFavorit        = "Фаворит"
        
        var index: Int {
            self == .all ? 0 : 1
        }
        
        init(index: Int) {
            self = index == 0 ? .all : .onlyFavorit
        }
    }

    enum ViewText: String {
        case title              = "Неправильные глаголы"
        case hideTranslate      = "Скрыть перевод"
        case empty              = "Нет слов"
    }

    
}
