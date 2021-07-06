//
//  FirebaseAutorization.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import Foundation
import Firebase
import AuthenticationServices


class FirebaseAutorization: NSObject {

    static let shared = FirebaseAutorization()
    
    private var firebaseAuth = Auth.auth()
    
    private var dataManager = FirebaseData.shared
    
    var isLoginUser: Bool{
        return firebaseAuth.currentUser != nil
    }
    
    var idUser: String?{
        return firebaseAuth.currentUser?.uid
    }
   
    
    func startAutorisation() {
        firebaseAuth.signIn(withEmail: "kostiantakoj@mail.ru", password: "kostiantakoj@mail") {[weak self] (user, error) in
            if let selF = self, let uid = user?.user.uid {
                print ("вошли")
                
                selF.dataManager.getUser(userUID: uid) {
                    print("получили узера")
                }
                
            } else {
                print ("Error signing out: %@", error)
            }
        }
    }
    
    
}


extension FirebaseAutorization: ASAuthorizationControllerDelegate {
    
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
//        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
//
//            guard let nonce = currentNonce,
//                  let appleIDToken = appleIDCredential.identityToken,
//                  let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
//                return
//            }
//
////            DefaultsUtils.saveAppleIDUser(appleIDCredential.user)
//
//            let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString, rawNonce: nonce)
//
//            let firstName = appleIDCredential.fullName?.givenName ?? "User"
//            let lastName = appleIDCredential.fullName?.familyName ?? "Name"
//
//            let fullName = "\(firstName) \(lastName)"
//
//            checkToken(credential: credential, name: fullName)
//        }
//    }
//
//    private func checkToken(credential: OAuthCredential, name: String){
//        firebaseAuth.signIn(with: credential) { (authResult, error) in
//            if error == nil {
//
////                if let idUser = self.idUser {
////                    self.dataManager.createUser(userId: idUser, name: name, provided: credential.provider)
////                }
//
//
//                DispatchQueue.main.async {
////                    appDelegateShared.login()
//                }
//            }
//        }
//    }
//
//
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
//        // Handle error.
//        print("Sign in with Apple errored: \(error)")
//    }
//
//    func appleIDStatus(compl: @escaping (Bool) -> ()){
//
//        let DF = DefaultUtils.shared
//
//        guard let id = DF.userAppleID else {
//            compl(false)
//            return
//        }
//
//        let appleIDProvider = ASAuthorizationAppleIDProvider()
//        appleIDProvider.getCredentialState(forUserID: id) {[weak self] (credentialState, error) in
//
//            DispatchQueue.main.async {
//                if credentialState == .revoked{
//
//                    do {
//                        self?.dataManager.profile = nil
//                        DF.userAppleID = nil
//                        try self?.firebaseAuth.signOut()
//
//                    } catch let signOutError as NSError {
//                        print ("Error signing out: %@", signOutError)
//                    }
//
//                    compl(true)
//                } else {
//                    compl(false)
//                }
//            }
//
//        }
//    }
    
}
