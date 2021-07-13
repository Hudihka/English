//
//  UIView.swift
//  English
//
//  Created by Константин Ирошников on 13.07.2021.
//

import Foundation
import UIKit

extension UIView {
    
    func addRadius(number: CGFloat) {
        self.layer.cornerRadius = number
        self.layer.masksToBounds = true
    }

    func cirkleView() {
        let value = min(self.frame.height, self.frame.width)
        
        let radius = value / 2
        self.addRadius(number: radius)
    }
    
}
