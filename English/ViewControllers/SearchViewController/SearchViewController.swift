//
//  SearchViewController.swift
//  English
//
//  Created by Константин Ирошников on 11.08.2021.
//

import UIKit

protocol SearchViewControllerProtocol: AnyObject {
}

class SearchViewController: UIViewController {

    var presenter: SearchPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

extension SearchViewController: SearchViewControllerProtocol {
    
}
