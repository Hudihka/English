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
    
    
}
