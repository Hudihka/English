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
    private var masterInteractor: MasterSplitInteractorProtocol?
    private var detailInteractor: DetailSplitInteractorProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        let tuplMaster = DI.masterSplitViewController(SVC: self)
        let tuplDetail = DI.detailSplitViewController()

        masterInteractor = tuplMaster.interactor
        detailInteractor = tuplDetail.interactor

        viewControllers = [tuplMaster.NVC, tuplDetail.VC]
        preferredDisplayMode = .allVisible
    }

}

extension SplitViewController: SplitViewControllerProtocol {
    func answer(wordsAnswe: [WordAnswer], translateWayRusEng: Bool) {
        masterInteractor?.translateWayRusEng = translateWayRusEng
        detailInteractor?.translateWayRusEng = translateWayRusEng

        masterInteractor?.allAnswer(wordsAnswe: wordsAnswe)
    }
	
	func correctedAnswerTwoVC(wordsAnswe: [WordAnswer]){ //это после ответа
        masterInteractor?.allAnswer(wordsAnswe: wordsAnswe)
	}
	
	func answerDetailVC(wordAnswer: WordAnswer) { //это показ возможных вариантов ответа
        detailInteractor?.answerDetailVC(wordAnswer: wordAnswer)
	}
}
