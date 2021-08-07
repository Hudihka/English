//
//  NewWordEndpoits.swift
//  English
//
//  Created by Константин Ирошников on 01.08.2021.
//

import Foundation

enum NewWordEndpoits {

    enum Labels: String {
        case rus        = "Введте русское значение"
        case engl       = "Введте английское значение"
        case descript   = "Описание если надо"
    }

    enum TextField: String {
        case rus        = "RUS"
        case engl       = "ENG"
        case descript   = "Описание"
    }

    enum ButtonText: String {
        case add        = "ДОБАВИТЬ"
        case change     = "ИЗМЕНИТЬ"
        case mix        = "↓↑"
        case leftBB     = "Отмена"
    }
}
