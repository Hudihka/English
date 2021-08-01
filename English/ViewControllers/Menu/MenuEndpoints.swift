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
        case rightBB        = "+"
    }

    enum AlertError: String {
        case title          = "Ошибка"
        case description    = "Нельзя тиспользовать такое имя"
    }
}
