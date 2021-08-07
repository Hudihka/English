//
//  MenuEndpoints.swift
//  English
//
//  Created by Константин Ирошников on 22.07.2021.
//

import Foundation

enum MenuEndpointsEnum {

    enum ActionButtonsAlert: String {
        case title    = "Выберите направление"
        case rusEngl  = "Рус -> Англ"
        case englRus  = "Англ -> Рус"
        case cramming = "Зубрешка"
    }

    enum AlertTF: String {
        case title          = "Введите название новой темы"
        case actionTitle    = "Ok"
        case cancelTitle    = "Отмена"
        case theme          = "Тема"
    }

    enum ViewText: String {
        case title          = "ТЕМЫ"
        case rightBB        = "add"
    }

    enum AlertError: String {
        case title          = "Ошибка"
        case description    = "Нельзя тиспользовать такое имя"
    }
	
	enum CellText {
		case header(Int)
		case cell(countThem: Int, countWord: Int)
		case favorit
		case allWord(Int)
		
		var text: String {
			switch self {
			case .header(let count):
				return "Всего \(count) выбранных слов"
			case .cell(let countThem, let countWord):
				return "Всего \(countThem) тем, \(countWord) слов"
			case .favorit :
				return "Выбранные слова"
			case .allWord(let count):
				return "\(count) слов"
			}
		}
	}
	
	enum TableContextMenu: String {
        case rename     = "Переименовать"
        case addWord    = "Добавить слово"
		case delete     = "Удалить"
	}
}
