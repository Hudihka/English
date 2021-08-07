//
//  BaseViewController.swift
//  English
//
//  Created by Константин Ирошников on 06.07.2021.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    
    var leftTextBBItem: String?{
        return nil
    }
    
    var rightTextBBItem: String?{
        return nil
    }
    
    var titleText: String?{
        return nil
    }

    var rightColor: UIColor {
        return UIColor.black
    }

    var leftColor: UIColor {
        return UIColor.black
    }
	
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        addLeftBBItem()
        addRightBBItem()
        
        self.title = titleText
        
        desingUI()
    }
    
    private func addLeftBBItem(){
        
        guard let leftTextBBItem = leftTextBBItem else {return}
        
        let left = UIBarButtonItem(title: leftTextBBItem, style: .plain, target: self, action: #selector(leftBBItem))
        left.tintColor = leftColor
        navigationItem.leftBarButtonItem = left
    }
    
    func addRightBBItem(){
        
        guard let rightTextBBItem = rightTextBBItem else {return}
        
        let right = UIBarButtonItem(title: rightTextBBItem, style: .plain, target: self, action: #selector(rightBBItem))
        right.tintColor = rightColor
        navigationItem.rightBarButtonItem = right
    }

    @objc func leftBBItem(){}
    
    @objc func rightBBItem(){}
    
    func desingUI(){}

}
