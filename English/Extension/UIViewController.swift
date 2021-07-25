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
        self.present(alert, animated: true, completion:{
                alert.view.superview?.isUserInteractionEnabled = true
                alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertControllerBackgroundTapped)))
            })
    }

    func showAlertThreeButton(title: String?,
                              message: String?,
                              buttonText1: String? = "",
                              action1: ((UIAlertAction) -> Void)? = nil,
                              buttonText2: String? = "",
                              action2: ((UIAlertAction) -> Void)? = nil,
                              buttonText3: String? = "",
                              action3: ((UIAlertAction) -> Void)? = nil){

        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: buttonText1, style: UIAlertAction.Style.default, handler: action1))
        alert.addAction(UIAlertAction(title: buttonText2, style: UIAlertAction.Style.default, handler: action2))
        alert.addAction(UIAlertAction(title: buttonText3, style: UIAlertAction.Style.cancel, handler: action3))

        self.present(alert, animated: true, completion:{
                alert.view.superview?.isUserInteractionEnabled = true
                alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertControllerBackgroundTapped)))
            })
    }

    func showAlertTextField(title:String? = nil,
                            message:String? = nil,
                            actionTitle: String?,
                            cancelTitle: String?,
                            inputPlaceholder:String? = nil,
                            inputStartText:String? = nil,
                            actionHandler: ((_ text: String?) -> Void)? = nil) {

           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

           alert.addTextField { (textField:UITextField) in
                textField.text = inputStartText
                textField.textColor = .black
                textField.placeholder = inputPlaceholder
                textField.keyboardType = UIKeyboardType.default
                textField.autocapitalizationType = .words
           }
           alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { (action: UIAlertAction) in
               guard let textField = alert.textFields?.first,
                     let text = textField.text else {
                   actionHandler?(nil)
                   return
               }
            actionHandler?(text.textEditor)
           }))
           alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: nil))

            self.present(alert, animated: true, completion:{
                alert.view.superview?.isUserInteractionEnabled = true
                alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertControllerBackgroundTapped)))
            })
       }

    @objc private func alertControllerBackgroundTapped(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func showAlertError(error: Error){
        Vibro.weak()
        self.showAlert(title: "ERROR", message: error.localizedDescription)
    }
    
    
    
    
}

