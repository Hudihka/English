//
//  UINavigationController.swift
//  English
//
//  Created by Константин Ирошников on 06.07.2021.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func popViewControllerWithHandler(completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popViewController(animated: true)
        CATransaction.commit()
    }
    
    func pushViewController(viewController: UIViewController, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.pushViewController(viewController, animated: true)
        CATransaction.commit()
    }
    
    func fontBar(font: UIFont?, color: UIColor){
        guard let font = font else {return}
        let attributes = [NSAttributedString.Key.font : font, NSAttributedString.Key.foregroundColor : color]
        
        let NB = self.navigationBar
        
        NB.standardAppearance.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
    }
    
    
    func clearBar(){
        let NB = self.navigationBar
        
        NB.tintColor = UIColor.black
        NB.standardAppearance.backgroundColor = UIColor.white //если сделать прозрачным, то по факту будет черным
        NB.standardAppearance.backgroundEffect = nil
        NB.standardAppearance.shadowImage = UIImage()
        NB.standardAppearance.shadowColor = .clear
        NB.standardAppearance.backgroundImage = UIImage()
    }
}
