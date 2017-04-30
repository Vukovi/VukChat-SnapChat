//
//  AuthService.swift
//  VukChat
//
//  Created by Vuk on 4/30/17.
//  Copyright © 2017 Vuk. All rights reserved.
//

import Foundation
import Firebase

class AuthService {

    private static let _singleton = AuthService()
    
    static var singleton: AuthService {
        return _singleton
    }
    
    func login(email:String, password: String) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                if let errorCode = FIRAuthErrorCode(rawValue: error!._code) {
                    if errorCode == .errorCodeUserNotFound {
                        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                //show error to the user
                            } else {
                                if user?.uid != nil {
                                    //Sign in
                                    FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if error != nil {
                                            //show error to the user
                                        } else {
                                            //successfully logged in
                                        }
                                    })
                                }
                            }
                        })
                    }
                } else {
                    //handle all of the other error types
                }
            } else {
                //successfully logged in
            }
        })
    }
}
