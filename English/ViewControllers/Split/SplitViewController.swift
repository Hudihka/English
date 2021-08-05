//
//  SplitViewController.swift
//  English
//
//  Created by Константин Ирошников on 05.08.2021.
//

import UIKit

protocol SplitViewControllerProtocol: AnyObject {
    func answer(wordsAnswe: [WordAnswer], translateWayRusEng: Bool)
	func correctedAnswerTwoVC(wordsAnswe: [WordAnswer])
	func answerDetailVC(wordAnswer: WordAnswer)
}

class SplitViewController: UISplitViewController {
    var presenter: SplitPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

		
    }

}

extension SplitViewController: SplitViewControllerProtocol {
    func answer(wordsAnswe: [WordAnswer], translateWayRusEng: Bool) {
		
    }
	
	func correctedAnswerTwoVC(wordsAnswe: [WordAnswer]){ //это после ответа
		
	}
	
	func answerDetailVC(wordAnswer: WordAnswer) { //это показ возможных вариантов ответа
		
	}
}
