//
//  WordsPresenter.swift
//  English
//
//  Created by Константин Ирошников on 01.08.2021.
//

import Foundation

final class WordsViewModel: WordsProtocolIn, WordsProtocolOut {
    private let UD = DefaultUtils.shared
    private let dataProvider = DataProvider.shared
    
    var segmentIndex: (Int) -> Void             = { _ in }
    var switchValue: (Bool) -> Void             = { _ in }
    var arrayLists: ([List]) -> Void            = { _ in }
    
    func giveMeData() {
        
        segmentIndex(indexSegment)
        switchValue(UD.hideTranslate)
        
        updateLists()
    }
    
    
    func tapedFavorit(word: Word) {
        var newWord = word
        newWord.isFavorit = !word.isFavorit
        
        dataProvider.update(word: newWord)
        updateLists()
    }
    
    func tapedSegment(segment: WordsEndpoint.Segment) {
        UD.translateWay = segment.index
        updateLists()
    }
    
    func tapedSwitch(value: Bool) {
        UD.hideTranslate = value
        updateLists()
    }
}

private extension WordsViewModel {
    var indexSegment: Int {
        UD.translateWay
    }
    
    func updateLists() {
        if WordsEndpoint.Segment(index: indexSegment) == .all {
            arrayLists(dataProvider.allLists)
        } else {
            arrayLists(dataProvider.onlyFavorit)
        }
    }
}
