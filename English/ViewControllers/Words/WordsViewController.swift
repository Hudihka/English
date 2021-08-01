//
//  WordsViewController.swift
//  English
//
//  Created by Константин Ирошников on 01.08.2021.
//

import UIKit

protocol WordViewControllerProtocol: AnyObject {

}

class WordsViewController: BaseViewController {
    var presenter: WordsPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension WordsViewController: WordViewControllerProtocol {

}
