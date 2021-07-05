//
//  AuthorizationViewController.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    private let autoriz = FirebaseAutorization.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    static func route() -> AuthorizationViewController {
        let storuboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storuboard.instantiateViewController(identifier: "AuthorizationViewController") as! AuthorizationViewController
        
        return VC
    }

    @IBAction func autoriz(_ sender: Any) {
        autoriz.startSignInWithAppleFlow()
    }
}
