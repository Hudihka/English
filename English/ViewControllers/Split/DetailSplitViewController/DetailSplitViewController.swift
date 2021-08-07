//
//  MasterSplitViewController.swift
//  English
//
//  Created by Hudihka on 06/08/2021.
//

import Foundation
import UIKit

protocol DetailSplitViewControllerProtocol: AnyObject {
    func labels(title: String, label: String)
    func labelText(text: String)
    func answerTexts(texts: [String])
}

class DetailSplitViewController: BaseViewController{
    
    var presenter: DetailSplitPresenterProtocol?
	private var table: DetailSplitTableView!
    private var label: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override var rightTextBBItem: String?{
        return SplitEndpoint.MasterText.leftBBItem.rawValue
    }

    override var rightColor: UIColor{
        return UIColor.red
    }

    @objc override func rightBBItem(){
        presenter?.tapedDissmis()
    }

    override func desingUI() {

        label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.isHidden = true
        view.addSubview(label)

        label.snp.makeConstraints({ (make) in
            make.height.greaterThanOrEqualTo(26)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.centerX.equalTo(view.center.x)
            make.centerY.equalTo(view.center.y)
        })


		table = DetailSplitTableView(presenter: presenter)
        table.isHidden = true
		view.addSubview(table)
        table.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        })
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
            if UIDevice.current.orientation.isLandscape {
                self.navigationItem.setRightBarButton(nil, animated: true)
            } else {
                self.addRightBBItem()
            }
        }

}

extension DetailSplitViewController: DetailSplitViewControllerProtocol {
    func labels(title: String, label: String) {
        self.title = title
        self.label.text = label
    }


    func labelText(text: String){
        if label.isHidden {
            UIView.animate(withDuration: 0.25) {
                self.table.isHidden = true
                self.label.isHidden = false
            }
        }
    }

    func answerTexts(texts: [String]) {
        table.isHidden = false
        label.isHidden = true
        table.wordsText = texts
    }
}
