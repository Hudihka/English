//
//  WordAnswer.swift
//  English
//
//  Created by Hudihka on 04/08/2021.
//

import Foundation

struct WordAnswer {
	let word: Word
	var wordsAnswer: [Word] = []
	var answer: Bool?
	
	init(word: Word) {
		self.word = word
	}
	
	mutating func createWordsAnswers(allWords: [Word]){
		if answer == nil, wordsAnswer.isEmpty {
            if allWords.count < 10 {
                wordsAnswer = allWords
            } else {
                let arrayDontAnswer = allWords.filter({$0.id != word.id})
                wordsAnswer = arrayDontAnswer[word]
            }
		}
	}
	
	mutating func creteAnswer(word: Word){
		if answer == nil,
			word.id != nil,
			self.word.id != nil {

			self.wordsAnswer = []
			answer = word.id == self.word.id
		}
	}
}
