//
//  FirebaseAutorization.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import Foundation
import Firebase
import CryptoKit
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
   
    
    //MARK: - МЕТОДЫ ДЛЯ ЭПЛ РЕГИСТРАЦИИ
    
    fileprivate var currentNonce: String?
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> =
            Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
    
    
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    func startSignInWithAppleFlow() {
        let nonce = randomNonceString()
        currentNonce = nonce
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName]
        request.nonce = sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
//        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
}


extension FirebaseAutorization: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            
            guard let nonce = currentNonce,
                  let appleIDToken = appleIDCredential.identityToken,
                  let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                return
            }
            
//            DefaultsUtils.saveAppleIDUser(appleIDCredential.user)
            
            let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString, rawNonce: nonce)
            
            let firstName = appleIDCredential.fullName?.givenName ?? "User"
            let lastName = appleIDCredential.fullName?.familyName ?? "Name"
            
            let fullName = "\(firstName) \(lastName)"
            
            checkToken(credential: credential, name: fullName)
        }
    }
    
    private func checkToken(credential: OAuthCredential, name: String){
        firebaseAuth.signIn(with: credential) { (authResult, error) in
            if error == nil {
                
//                if let idUser = self.idUser {
//                    self.dataManager.createUser(userId: idUser, name: name, provided: credential.provider)
//                }
                
                
                DispatchQueue.main.async {
//                    appDelegateShared.login()
                }
            }
        }
    }
    
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
        print("Sign in with Apple errored: \(error)")
    }
    
    func appleIDStatus(compl: @escaping (Bool) -> ()){
        
        let DF = DefaultUtils.shared
        
        guard let id = DF.userAppleID else {
            compl(false)
            return
        }
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        appleIDProvider.getCredentialState(forUserID: id) {[weak self] (credentialState, error) in
            
            DispatchQueue.main.async {
                if credentialState == .revoked{
                    
                    do {
                        self?.dataManager.profile = nil
                        DF.userAppleID = nil
                        try self?.firebaseAuth.signOut()
                        
                    } catch let signOutError as NSError {
                        print ("Error signing out: %@", signOutError)
                    }
                    
                    compl(true)
                } else {
                    compl(false)
                }
            }
            
        }
    }
    
}
