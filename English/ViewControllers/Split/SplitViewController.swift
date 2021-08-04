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
//    func words(words: [Word])
}

class SplitViewController: UISplitViewController {
    var presenter: SplitPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

//        presenter?.fetchData()
    }

}

extension SplitViewController: SplitViewControllerProtocol {}
