//
//  AuthenticationViewModel.swift
//  WeShoppin
//
//  Created by Dhiva Krishna on 10/27/21.
//

import Foundation
import FirebaseAuth


class AuthenticationViewModel: ObservableObject {
    
    var auth = Auth.auth()
    var signedIn: Bool = false
    
    func isSignedIn() -> Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) -> Bool {
        var signInResult: Bool = false
        DispatchQueue.main.async {
            self.auth.signIn(withEmail: email, password: password, completion: {  _, error in
                if error == nil {
                    print("Logged in")
                    signInResult = true
                } else {
                    print("Error in login: \(error?.localizedDescription ?? "")")
                    signInResult = false
                }
            })
        }
        return signInResult
    }
    
    
    
    func createAccount(email: String, password: String) -> Bool {
        var result: Bool = false
        auth.createUser(withEmail: email, password: password, completion: { _, error in
            if error == nil {
                print("Created account")
                result = true
            } else {
                print("Error in createUser: \(error?.localizedDescription ?? "")")
                result = false
            }
        })
        return result
    }

}
