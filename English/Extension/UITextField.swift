//
//  UITextField.swift
//  English
//
//  Created by Hudihka on 26/07/2021.
//

import Foundation
import UIKit

extension UITextField {
    
	func settingsTF(placeholder: String?,
					returnKeyType: UIReturnKeyType = .next,
					delegateObj: UITextFieldDelegate) {
		
		self.placeholder = placeholder
		self.borderStyle = UITextField.BorderStyle.roundedRect
		self.autocorrectionType = UITextAutocorrectionType.no
		self.keyboardType = UIKeyboardType.default
		self.returnKeyType = returnKeyType
//		self.clearButtonMode = UITextField.ViewMode.whileEditing
		self.delegate = delegateObj
    }
    
	func resultString(string: String, range: NSRange) -> String {
        let text: NSString = (self.text ?? "") as NSString
        return text.replacingCharacters(in: range, with: string)
    }
}
