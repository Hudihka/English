//
//  SplitViewController.swift
//  English
//
//  Created by Константин Ирошников on 05.08.2021.
//

import UIKit

protocol SplitViewControllerProtocol: AnyObject {
//    func fetchTitle(text: String)
//    func fetchSegmentControll(index: Int)
//    func fetchSwitch(isOn: Bool)
//
    func answer(wordsAnswe: [WordAnswer], translateWayRusEng: Bool)
}

class SplitViewController: UISplitViewController {
    var presenter: SplitPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

//        presenter?.fetchData()
    }

}

extension SplitViewController: SplitViewControllerProtocol {
    func answer(wordsAnswe: [WordAnswer], translateWayRusEng: Bool) {

    }
}
