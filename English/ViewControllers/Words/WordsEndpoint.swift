//
//  WordsEndpoint.swift
//  English
//
//  Created by Константин Ирошников on 01.08.2021.
//

import Foundation

enum WordsEndpoint {

    enum Text: String {
        case rus         = "Рус -> Англ"
        case engl        = "Англ -> Рус"
        case hide        = "Скрыть перевод"
        case onlyFavorit = "Только фаворит"
        case emptyWords  = "Нет слов"
		case title 		 = "ФАВОРИТ"
    }

    enum ViewText: String {
        case rightBB        = "add"
    }
	
	enum TableContextMenu: String {
        case rename     = "Изменить"
		case delete     = "Удалить"
	}

}
