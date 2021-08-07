//
//  MasterSplitViewController.swift
//  English
//
//  Created by Hudihka on 06/08/2021.
//

import Foundation
import UIKit

protocol MasterSplitViewControllerProtocol: AnyObject {
    func count(countTrue: Int, countFalse: Int)
    func startSettingsTableview(wordsAnswe: [WordAnswer], translateWayRusEng: Bool)
}

class MasterSplitViewController: BaseViewController{
    
    var presenter: MasterSplitPresenterProtocol?
	private var table: MasterSlitTableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override var leftTextBBItem: String?{
        return SplitEndpoint.MasterText.leftBBItem.rawValue
    }

    override var leftColor: UIColor{
        return UIColor.red
    }

    @objc override func leftBBItem(){
        presenter?.tapedDissmis()
    }

    override func desingUI() {
		table = MasterSlitTableView(presenter: presenter)
		view.addSubview(table)
        table.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        })
    }

}

extension MasterSplitViewController: MasterSplitViewControllerProtocol {

    func count(countTrue: Int, countFalse: Int) {
        table.countTrue = countTrue
        table.countFalse = countFalse
    }

    func startSettingsTableview(wordsAnswe: [WordAnswer],
                                translateWayRusEng: Bool) {
        table.rusEngWay = translateWayRusEng
        table.wordsAnswer = wordsAnswe
    }

}
