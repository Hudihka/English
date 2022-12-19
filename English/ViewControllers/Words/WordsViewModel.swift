//
//  WordsPresenter.swift
//  English
//
//  Created by Константин Ирошников on 01.08.2021.
//

import Foundation

final class WordsViewModel: WordsProtocolIn, WordsProtocolOut {
    var segmentIndex: (Int) -> Void             = { _ in }
    var switchValue: (Bool) -> Void             = { _ in }
    var arrayAllLists: ([List]) -> Void         = { _ in }
    var arrayFavoritLists: ([List]) -> Void     = { _ in }
    
    func giveMeData() {
        
    }
    
    
    func tapedFavorit(word: Word) {
        <#code#>
    }
    
    func tapedSegment(segment: WordsEndpoint.Segment) {
        <#code#>
    }
    
    func tapedSwitch(value: Bool) {
        <#code#>
    }
}
