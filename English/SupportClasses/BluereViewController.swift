//
//  BluereViewController.swift
//  English
//
//  Created by Константин Ирошников on 13.07.2021.
//

import Foundation
import UIKit
import SnapKit

final class BluereViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        desingUI()
    }
    
    private func desingUI() {
        
        self.view.backgroundColor = UIColor.clear
        let blure = VisualEffectView(frame: self.view.frame)
        blure.enumBlureValue = .midl
        
        self.view.addSubview(blure)
        
        let spiner = UIActivityIndicatorView(style: .large)
        spiner.color = UIColor.black
        
        self.view.addSubview(spiner)
        
        spiner.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view)
        }
    }
    
    
    static private let activityWindow = UIWindow()
    
    static func route() {
        
        let vc = BluereViewController()
        activityWindow.rootViewController = vc
        activityWindow.backgroundColor = UIColor.clear
        activityWindow.isHidden = false
        activityWindow.windowLevel = UIWindow.Level(rawValue: 1)
        activityWindow.makeKeyAndVisible()
        
//        vc.animateAppear()
    }
    
    
    class func hide() {
        activityWindow.removeFromSuperview()
        activityWindow.resignKey()
        activityWindow.isHidden = true
    }
    
    
}
