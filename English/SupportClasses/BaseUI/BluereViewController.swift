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
        blure.backgroundColor = UIColor.white.withAlphaComponent(0.25)
        blure.enumBlureValue = .midl
        blure.blureValue()
        
        self.view.addSubview(blure)
        
        let spiner = UIActivityIndicatorView(style: .large)
        spiner.color = UIColor.black
        spiner.startAnimating()
        
        self.view.addSubview(spiner)

        spiner.snp.makeConstraints { make in
            make.centerY.equalTo(self.view).offset(-50)
            make.centerX.equalTo(self.view.center.x)
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
    }
    
    
    class func hide() {
        activityWindow.removeFromSuperview()
        activityWindow.resignKey()
        activityWindow.isHidden = true
    }
    
    
}
