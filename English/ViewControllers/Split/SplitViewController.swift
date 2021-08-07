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
    private var detailViewController: UIViewController!
    private var detailInteractor: DetailSplitInteractorProtocol?
    private var flagLoadDetail = false //нужен для того, что бы при первом запуске не делать сразу переход

    override func viewDidLoad() {
        super.viewDidLoad()

        let tuplMaster = DI.masterSplitViewController(SVC: self)
        let tuplDetail = DI.detailSplitViewController(SVC: self)

        masterInteractor = tuplMaster.interactor
        detailInteractor = tuplDetail.interactor
        detailViewController = tuplDetail.NVC

        masterInteractor?.choiceWordAnswer = {[weak self] word in
            self?.presenter?.choseWordToCheck(wordAnser: word)
        }

        detailInteractor?.choiceWord = {[weak self] word in
            self?.presenter?.tapedAnswer(word: word)
        }

        viewControllers = [tuplMaster.NVC, detailViewController]
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
        if let DVC = detailViewController, flagLoadDetail {
            self.showDetailViewController(DVC, sender: nil)
        } else {
            flagLoadDetail = true
        }

        detailInteractor?.answerDetailVC(wordAnswer: wordAnswer)
	}
}
