//
//  DataProvider.swift
//  English
//
//  Created by Худышка К on 20.12.2022.
//

import Foundation

final class DataProvider {
    static let shared = DataProvider()
    
    private(set) var allLists = [List]()
    
    func generateListContent() {
        self.allLists = List.generateListsArray(json: contentJSON)
    }
    
    func update(word: Word) {
        allLists.enumerated().forEach { (indexList, list) in
            if let indexWord = list.words.firstIndex(where: { $0.key == word.key }) {
                allLists[indexList].words[indexWord] = word
                
                return
            }
        }
    }
    
    var onlyFavorit: [List] {
        var lists = [List]()
        
        for var list in allLists {
            let words = list.words.filter({ $0.isFavorit })
            list.words = words
            
            lists.append(list)
        }
        
        return lists
    }
}




