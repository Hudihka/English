//
//  MenuViewController.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import UIKit

protocol MenuViewControllerIn: AnyObject {
}

class MenuViewController: BaseViewController, MenuViewControllerIn {
    
    private var tableView: MenuTableView!
    
    var presenter: MenuPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var titleText: String?{
        return "ТЕМЫ"
    }
    
    override var rightTextBBItem: String?{
        return "+"
    }
    
    @objc override func rightBBItem(){
        
    }
    
    override func desingUI() {
        tableView = MenuTableView()
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }
    }

}
