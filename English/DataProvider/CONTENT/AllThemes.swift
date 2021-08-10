//
//  AllThemes.swift
//  English dictionary
//
//  Created by Hudihka on 01/12/2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import Foundation

class AllThemes{
	
	static let jsonAllContent: [JSON] = [
//		NotTheme.allContent,
//        BodyParts.allContent,
//        ProfessionAndWork.allContent,
        Verbs.allContent,
//        DestinationsAndLocations.allContent,
        Food.allContent,
//        Clothes.allContent,
//        Time.allContent,
//        Funiture.allContent,
//        Prepositions.allContent,
//        Phrases.allContent,
//        Subjects.allContent,
//        FamilyAndHobbies.allContent,
//        Adjectives.allContent,
//		December2020.allContent,
//        Januri2021.allContent,
		Februaru2021.allContent,
		March2021.allContent,
//        FebruaruJune2021.allContent,
        Jule2021.allContent
	]
    
    static var count: Int{
        
        var count = 0
        AllThemes.jsonAllContent.forEach { (json) in
            if let wordsJSON = json["allWords"] as? [JSON]{
                count += wordsJSON.count
            }
        }
        
        return count
    }

    static var allLists: [List] {
        var returnLists = [List]()
        for theme in AllThemes.jsonAllContent {

            if let listName = theme["theme"] as? String,
               let count = (theme["allWords"] as? [JSON])?.count{

                var json: [String : Any] = [:]

                json["name"]            = listName
                json["count"]           = count
                json["favorit"]         = 0
                json["dateUpdate"]      = Date().printDate()

                let list = List(json: json)
                returnLists.append(list)
            }
        }

        return returnLists
    }

    static var allWords: [Word] {
        var returnWords = [Word]()
        for theme in AllThemes.jsonAllContent {

            if let listName = theme["theme"] as? String,
               let words = theme["allWords"] as? [JSON]{

                for var themeWordsJson in words {
                    themeWordsJson["listName"] = listName
                    let word = Word(json: themeWordsJson, id: nil)
                    returnWords.append(word)
                }
            }
        }

        return returnWords
    }
	
	
	
	
}
