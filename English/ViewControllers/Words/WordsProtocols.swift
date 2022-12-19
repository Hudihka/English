//
//  WordsProtocols.swift
//  English
//
//  Created by Худышка К on 20.12.2022.
//

import Foundation

protocol WordsProtocolIn {
    func tapedFavorit(word: Word)
    func tapedSegment(segment: WordsEndpoint.Segment)
    func tapedSwitch(value: Bool)
    
    func giveMeData()
}

protocol WordsProtocolOut {
    var segmentIndex: (Int) -> Void { get set }
    var switchValue: (Bool) -> Void { get set }
    var arrayAllLists: ([List]) -> Void { get set }
    var arrayFavoritLists: ([List]) -> Void { get set }
}
