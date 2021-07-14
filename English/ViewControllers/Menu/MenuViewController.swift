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
    
    private var tableView: UITableView!
    
    var presenter: MenuPresenter?
    
    private var profile: Profile? {
        didSet{
            
        }
    }

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
        <#code#>
    }

}
