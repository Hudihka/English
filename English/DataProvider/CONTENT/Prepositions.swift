//
//  Prepositions.swift
//  English dictionary
//
//  Created by Админ on 13.12.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import Foundation


class Prepositions {
    
    public static let allContent: JSON = ["theme" : "Предлоги", "allWords" : Prepositions.words]
    
    private static let words: [JSON] = [
        ["engValue" : "goot at", "rusValue" : "быть хорошим в чем то", "descript" : ""],
        ["engValue" : "where", "rusValue" : "где", "descript" : ""],
        ["engValue" : "what", "rusValue" : "что/какой", "descript" : ""],
        ["engValue" : "but", "rusValue" : "но", "descript" : ""],
        ["engValue" : "at", "rusValue" : "находится где то", "descript" : ""],
        ["engValue" : "with", "rusValue" : "с", "descript" : ""],
        ["engValue" : "without", "rusValue" : "без", "descript" : ""],
        ["engValue" : "sure", "rusValue" : "конечно", "descript" : ""],
        ["engValue" : "these", "rusValue" : "эти", "descript" : ""],
        ["engValue" : "also", "rusValue" : "так же", "descript" : ""],
        ["engValue" : "when", "rusValue" : "когда", "descript" : ""],
        ["engValue" : "this", "rusValue" : "это", "descript" : "то что рядом в ед числе"],
        ["engValue" : "these", "rusValue" : "эти", "descript" : "то что рядом во мн числе"],
        ["engValue" : "that", "rusValue" : "тот", "descript" : "в ед числе до чего не можем дотянуться"],
        ["engValue" : "those", "rusValue" : "те", "descript" : "много и на расстоянии"],
        ["engValue" : "so", "rusValue" : "так", "descript" : ""],
        ["engValue" : "before", "rusValue" : "до", "descript" : ""],
        ["engValue" : "after", "rusValue" : "после", "descript" : ""],
        ["engValue" : "about", "rusValue" : "примерно", "descript" : ""],
        ["engValue" : "then", "rusValue" : "затем", "descript" : ""],
        ["engValue" : "some time", "rusValue" : "реже", "descript" : ""],
        ["engValue" : "together", "rusValue" : "вместе", "descript" : ""],
        ["engValue" : "none", "rusValue" : "ни чего", "descript" : ""],
        ["engValue" : "some", "rusValue" : "несколько", "descript" : ""],
        ["engValue" : "there", "rusValue" : "там", "descript" : ""],
        ["engValue" : "they're", "rusValue" : "они", "descript" : ""],
        ["engValue" : "their", "rusValue" : "их", "descript" : ""],
        ["engValue" : "both", "rusValue" : "оба", "descript" : ""],
        ["engValue" : "whitch", "rusValue" : "который из", "descript" : "ограниченное количество"],
        ["engValue" : "only", "rusValue" : "только/единственный", "descript" : ""],
        ["engValue" : "maybe", "rusValue" : "может быть", "descript" : ""],
        ["engValue" : "pair", "rusValue" : "пара", "descript" : ""],
        ["engValue" : "couple", "rusValue" : "пара (муж + жен)", "descript" : ""],
        ["engValue" : "other places", "rusValue" : "другой/чужой", "descript" : ""],
        ["engValue" : "whole", "rusValue" : "весь/целый", "descript" : ""],
        ["engValue" : "after that", "rusValue" : "после этого", "descript" : ""],
        ["engValue" : "every where", "rusValue" : "везде", "descript" : ""],
        ["engValue" : "again", "rusValue" : "еще раз", "descript" : ""],
        ["engValue" : "under", "rusValue" : "под", "descript" : ""],
        ["engValue" : "by", "rusValue" : "у", "descript" : ""],
        ["engValue" : "on", "rusValue" : "на", "descript" : ""],
        ["engValue" : "under", "rusValue" : "под", "descript" : ""],
        ["engValue" : "behind", "rusValue" : "за", "descript" : ""],
        ["engValue" : "in frant of", "rusValue" : "перед", "descript" : ""],
        ["engValue" : "bet ween", "rusValue" : "между", "descript" : ""],
        ["engValue" : "for", "rusValue" : "на", "descript" : ""],
        ["engValue" : "for", "rusValue" : "в течении", "descript" : ""],
        ["engValue" : "most", "rusValue" : "большинство", "descript" : ""],
        ["engValue" : "same", "rusValue" : "одинаковые", "descript" : ""],
        ["engValue" : "even", "rusValue" : "даже", "descript" : ""],
        ["engValue" : "at all", "rusValue" : "совсем", "descript" : ""],
        ["engValue" : "either", "rusValue" : "тоже нет", "descript" : ""],
        ["engValue" : "bit", "rusValue" : "чуть чуть", "descript" : ""],
        ["engValue" : "same", "rusValue" : "такой же", "descript" : ""],
        ["engValue" : "some", "rusValue" : "несколько", "descript" : ""],
        ["engValue" : "until", "rusValue" : "до", "descript" : ""],
        ["engValue" : "more", "rusValue" : "больше", "descript" : ""],
        ["engValue" : "less", "rusValue" : "меньше", "descript" : ""],
        ["engValue" : "that", "rusValue" : "что/который", "descript" : ""],
        ["engValue" : "nearly", "rusValue" : "почти", "descript" : ""],
        ["engValue" : "there", "rusValue" : "тaм", "descript" : ""],
        ["engValue" : "too", "rusValue" : "тоже", "descript" : ""],
        ["engValue" : "own", "rusValue" : "собственный", "descript" : ""],
        ["engValue" : "whose", "rusValue" : "чей", "descript" : ""],
        ["engValue" : "without", "rusValue" : "без", "descript" : ""],
        ["engValue" : "had", "rusValue" : "было", "descript" : ""],
        ["engValue" : "whatever", "rusValue" : "без разницы", "descript" : ""],
        ["engValue" : "still", "rusValue" : "все еще/все равно", "descript" : ""],
        ["engValue" : "everything", "rusValue" : "все", "descript" : ""],
        ["engValue" : "includes", "rusValue" : "включая", "descript" : ""],
        ["engValue" : "ever", "rusValue" : "когда либо", "descript" : ""]
    
    ]
    
}
