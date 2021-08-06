//
//  MasterSplitViewController.swift
//  English
//
//  Created by Hudihka on 06/08/2021.
//

import Foundation
import UIKit

protocol MasterSplitViewControllerProtocol: AnyObject {

}

class MasterSplitViewController: BaseViewController{
    
    var presenter: NewWordPresenterProtocol?
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
        //сбросить
    }

    override func desingUI() {
		table = MasterSlitTableView(presenter: <#T##MenuPresenterProtocol?#>, rusEngWay: <#T##Bool#>)
		view.addSubview(table)
        table.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        })
    }


    @objc private func buttonAction(sender: UIButton!) {
		presenter?.createWord()
    }
}
