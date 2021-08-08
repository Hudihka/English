//
//  Februaru-Juту2021.swift
//  English dictionary
//
//  Created by Константин Ирошников on 04.07.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import Foundation

class FebruaruJune2021 {
    
    public static let allContent: JSON = ["theme" : "2021 феврал-июнь", "allWords" : FebruaruJune2021.words]
    
    private static let words: [JSON] = [
        ["engValue" : "a match", "rusValue" : "совпадение", "descript" : ""],
        ["engValue" : "it's up to you", "rusValue" : "это зависит от вас", "descript" : ""],
        ["engValue" : "hand in", "rusValue" : "сдать", "descript" : ""],
        ["engValue" : "hand out", "rusValue" : "раздаточный материал", "descript" : ""],
        ["engValue" : "have in common", "rusValue" : "иметь общее", "descript" : ""],
        ["engValue" : "we have a lot in common", "rusValue" : "у нас много общего", "descript" : ""],
        ["engValue" : "common", "rusValue" : "общий", "descript" : ""],
        ["engValue" : "common sence", "rusValue" : "здравый смысл", "descript" : ""],
        ["engValue" : "actually", "rusValue" : "данный момент", "descript" : ""],
        ["engValue" : "bit", "rusValue" : "чуть чуть", "descript" : ""],
        ["engValue" : "nervous", "rusValue" : "нервничаю", "descript" : ""],
        ["engValue" : "probably", "rusValue" : "вероятно", "descript" : ""],
        ["engValue" : "neither", "rusValue" : "тоже нет", "descript" : ""],
        ["engValue" : "supporose", "rusValue" : "полагать", "descript" : ""],
        ["engValue" : "difenetly", "rusValue" : "точно", "descript" : ""],
        ["engValue" : "advantage", "rusValue" : "преймущество", "descript" : ""],
        ["engValue" : "disadvage", "rusValue" : "недостаток", "descript" : ""],
        ["engValue" : "perks", "rusValue" : "компенсация", "descript" : ""],
        ["engValue" : "before", "rusValue" : "до", "descript" : ""],
        ["engValue" : "there is/there are", "rusValue" : "имеет", "descript" : ""],
        ["engValue" : "a lot of", "rusValue" : "много", "descript" : ""],
        ["engValue" : "many", "rusValue" : "много", "descript" : ""],
        ["engValue" : "more", "rusValue" : "больше", "descript" : ""],
        ["engValue" : "child hood", "rusValue" : "детство", "descript" : ""],
        ["engValue" : "nearby", "rusValue" : "рядом", "descript" : ""],
        ["engValue" : "across", "rusValue" : "напротив", "descript" : ""],
        ["engValue" : "spoker man", "rusValue" : "человек по связи с общественностью", "descript" : ""],
        ["engValue" : "recipe", "rusValue" : "рецепт", "descript" : ""],
        ["engValue" : "happend", "rusValue" : "случаться", "descript" : ""],
        ["engValue" : "come", "rusValue" : "приходить", "descript" : ""],
        ["engValue" : "continued", "rusValue" : "продолжил", "descript" : ""],
        ["engValue" : "prepare", "rusValue" : "готовить", "descript" : ""],
        ["engValue" : "duck", "rusValue" : "утка", "descript" : ""],
        ["engValue" : "soft", "rusValue" : "мягкий", "descript" : ""],
        ["engValue" : "vest", "rusValue" : "майка алкоголичка", "descript" : ""],
        ["engValue" : "a dining room", "rusValue" : "столовая", "descript" : ""],
        ["engValue" : "a garden", "rusValue" : "сад", "descript" : ""],
        ["engValue" : "a kitchen", "rusValue" : "кухня", "descript" : ""],
        ["engValue" : "the ceiling", "rusValue" : "потолок", "descript" : ""],
        ["engValue" : "the floor", "rusValue" : "пол", "descript" : ""],
        ["engValue" : "the stairs", "rusValue" : "лестница", "descript" : ""],
        ["engValue" : "the wall", "rusValue" : "стена", "descript" : ""],
        ["engValue" : "carpet", "rusValue" : "полка", "descript" : ""],
        ["engValue" : "cooker", "rusValue" : "плита", "descript" : ""],
        ["engValue" : "cupboard", "rusValue" : "сервант", "descript" : ""],
        ["engValue" : "a lamb", "rusValue" : "фонарь", "descript" : ""],
        ["engValue" : "a light", "rusValue" : "светильник", "descript" : ""],
        ["engValue" : "a mirror", "rusValue" : "зеркало", "descript" : ""],
        ["engValue" : "plant", "rusValue" : "растение", "descript" : ""],
        ["engValue" : "a shelf", "rusValue" : "полка", "descript" : ""],
        ["engValue" : "in come", "rusValue" : "зарплата", "descript" : ""],
        ["engValue" : "clothers", "rusValue" : "одежда", "descript" : ""],
        ["engValue" : "overseas", "rusValue" : "заграничный", "descript" : ""],
        ["engValue" : "i dont catch", "rusValue" : "я не уловил суть", "descript" : ""],
        ["engValue" : "central heating", "rusValue" : "центральное отопление", "descript" : ""],
        ["engValue" : "in the subburts", "rusValue" : "окраина города", "descript" : ""],
        ["engValue" : "come", "rusValue" : "прийти", "descript" : ""],
        ["engValue" : "become", "rusValue" : "стали", "descript" : ""],
        ["engValue" : "impotant", "rusValue" : "важный", "descript" : ""],
        ["engValue" : "fiction", "rusValue" : "вымысел", "descript" : ""],
        ["engValue" : "sience", "rusValue" : "наука", "descript" : ""],
        ["engValue" : "sold", "rusValue" : "проданно", "descript" : ""],
        ["engValue" : "calm", "rusValue" : "спокойствие", "descript" : ""],
        ["engValue" : "semiliar", "rusValue" : "прохожий", "descript" : ""],
        ["engValue" : "trust", "rusValue" : "доверие", "descript" : ""],
        ["engValue" : "spent", "rusValue" : "потраченный", "descript" : ""],
        ["engValue" : "sence", "rusValue" : "смысл", "descript" : ""],
        ["engValue" : "grow", "rusValue" : "расти", "descript" : ""],
        ["engValue" : "own", "rusValue" : "собственный", "descript" : ""],
        ["engValue" : "tied", "rusValue" : "связанные", "descript" : ""],
        ["engValue" : "accept", "rusValue" : "принять", "descript" : ""],
        ["engValue" : "deep", "rusValue" : "глубокий", "descript" : ""],
        ["engValue" : "almost", "rusValue" : "почти", "descript" : ""],
        ["engValue" : "suddenly", "rusValue" : "внезапно", "descript" : ""],
        ["engValue" : "truck", "rusValue" : "грузовик", "descript" : ""],
        ["engValue" : "at the beginning of", "rusValue" : "в начале", "descript" : ""],
        ["engValue" : "crysis", "rusValue" : "кризис", "descript" : ""],
        ["engValue" : "sucks", "rusValue" : "отстой", "descript" : ""],
        ["engValue" : "it depends on what to compare with", "rusValue" : "это зависит от того с чем сравнивать", "descript" : ""],
        ["engValue" : "strangely", "rusValue" : "как не странно", "descript" : ""],
        ["engValue" : "again", "rusValue" : "очередной раз", "descript" : ""],
        ["engValue" : "refuse", "rusValue" : "мусор", "descript" : ""],
        ["engValue" : "sent", "rusValue" : "отправить", "descript" : ""],
        ["engValue" : "stick", "rusValue" : "полки", "descript" : ""],
        ["engValue" : "sheet", "rusValue" : "закрыть", "descript" : ""],
        ["engValue" : "wooder", "rusValue" : "деревянный", "descript" : ""],
        ["engValue" : "kicking", "rusValue" : "пинки", "descript" : ""],
        ["engValue" : "put together", "rusValue" : "собирать", "descript" : ""],
        ["engValue" : "live off smb", "rusValue" : "не зависит от кого либо", "descript" : ""],
        ["engValue" : "grab", "rusValue" : "схватить", "descript" : ""],
        ["engValue" : "get through", "rusValue" : "с чем либо справляться", "descript" : ""],
        ["engValue" : "have crush on", "rusValue" : "запасть на кого то", "descript" : ""],
        ["engValue" : "cleve", "rusValue" : "умный", "descript" : ""],
        ["engValue" : "to be glad to", "rusValue" : "рад видеть тебя", "descript" : ""],
        ["engValue" : "be snowed under with work", "rusValue" : "быть заваленным работой", "descript" : ""],
        ["engValue" : "to marry smb", "rusValue" : "жениться на ком либо", "descript" : ""],
        ["engValue" : "to appear", "rusValue" : "появиться", "descript" : ""],
        ["engValue" : "suite", "rusValue" : "набор", "descript" : ""],
        ["engValue" : "nex to", "rusValue" : "рядом", "descript" : ""],
        ["engValue" : "behind", "rusValue" : "за", "descript" : ""],
        ["engValue" : "over", "rusValue" : "над", "descript" : ""],
        ["engValue" : "in front of", "rusValue" : "позади", "descript" : ""],
        ["engValue" : "on", "rusValue" : "на", "descript" : ""],
        ["engValue" : "from...to", "rusValue" : "откуда куда", "descript" : ""],
        ["engValue" : "to wards", "rusValue" : "в направлении", "descript" : ""],
        ["engValue" : "fall in love", "rusValue" : "влюбиться", "descript" : ""],
        ["engValue" : "worried", "rusValue" : "обеспокоен", "descript" : ""],
        ["engValue" : "with out", "rusValue" : "без", "descript" : ""],
        ["engValue" : "greet", "rusValue" : "приветствовать", "descript" : ""],
        ["engValue" : "bow", "rusValue" : "кланяться", "descript" : ""],
        ["engValue" : "tap on the shoulder", "rusValue" : "хлопать по плечу", "descript" : ""],
        ["engValue" : "heighbaur", "rusValue" : "сосед", "descript" : ""],
        ["engValue" : "keep in touch", "rusValue" : "держать связа", "descript" : ""],
        ["engValue" : "cheers", "rusValue" : "всего хорошего", "descript" : ""],
        ["engValue" : "hope", "rusValue" : "надежда", "descript" : ""],
        ["engValue" : "fall in love", "rusValue" : "влюбиться", "descript" : ""],
        ["engValue" : "break up", "rusValue" : "раставаться", "descript" : ""],
        ["engValue" : "ask someone out", "rusValue" : "спросить кого то", "descript" : ""],
        ["engValue" : "get engaget to smb", "rusValue" : "обручиться с кем либо", "descript" : ""],
        ["engValue" : "go out with", "rusValue" : "встретиться с кем то", "descript" : ""],
        ["engValue" : "go on date", "rusValue" : "идти на свидание", "descript" : ""],
        ["engValue" : "make a date", "rusValue" : "назначить свидание", "descript" : ""],
        ["engValue" : "meet some one for the first time", "rusValue" : "встретить кого то в первый раз", "descript" : ""],
        ["engValue" : "huge", "rusValue" : "огромный", "descript" : ""],
        ["engValue" : "suddenly", "rusValue" : "внезапно", "descript" : ""],
        ["engValue" : "shape", "rusValue" : "форма", "descript" : ""],
        ["engValue" : "perhaps", "rusValue" : "возможно", "descript" : ""],
        ["engValue" : "movements", "rusValue" : "движения", "descript" : ""],
        ["engValue" : "current", "rusValue" : "текущий", "descript" : ""],
        ["engValue" : "explain", "rusValue" : "обьяснять", "descript" : ""],
        ["engValue" : "banging", "rusValue" : "стук", "descript" : ""],
        ["engValue" : "haunted", "rusValue" : "преследуемый", "descript" : ""],
        ["engValue" : "guest", "rusValue" : "гость", "descript" : ""],
        ["engValue" : "priest", "rusValue" : "священник", "descript" : ""],
        ["engValue" : "frightened", "rusValue" : "испуганный", "descript" : ""],
        ["engValue" : "remove control", "rusValue" : "дистанционное управление", "descript" : ""],
        ["engValue" : "so", "rusValue" : "поэтому", "descript" : ""],
        ["engValue" : "sick pay", "rusValue" : "оплачиваемый больничный", "descript" : ""],
        ["engValue" : "opportunites", "rusValue" : "возможность", "descript" : ""],
        ["engValue" : "promotion", "rusValue" : "повышение", "descript" : ""],
        ["engValue" : "have to", "rusValue" : "должен/обязан", "descript" : ""],
        ["engValue" : "don't have to", "rusValue" : "не нужно/нет необходимости", "descript" : ""],
        ["engValue" : "necessary", "rusValue" : "необходимо", "descript" : ""],
        ["engValue" : "least", "rusValue" : "самое малое", "descript" : ""],
        ["engValue" : "borrow", "rusValue" : "взял в долг", "descript" : ""],
    
    ]
    
}
