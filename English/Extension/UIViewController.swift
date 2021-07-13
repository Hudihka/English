//
//  UIViewController.swift
//  English
//
//  Created by Константин Ирошников on 06.07.2021.
//

import Foundation
import UIKit


extension UIViewController {
    
    func showAlert(title: String?, message: String?, buttonText: String? = "OK", action: ((UIAlertAction) -> Void)? = nil){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonText, style: UIAlertAction.Style.default, handler: action))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertError(error: Error){
        Vibro.weak()
        self.showAlert(title: "ERROR", message: error.localizedDescription)
    }
    
    
    
    
}

