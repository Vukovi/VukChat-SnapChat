//
//  AuthService.swift
//  VukChat
//
//  Created by Vuk on 4/30/17.
//  Copyright © 2017 Vuk. All rights reserved.
//

import Foundation
import Firebase

typealias Completion = (_ errMsg: String?, _ data: AnyObject?) -> Void //servis ne treba nista da obavlja u kontrolerima, zato sam napravio ovaj klozer kojim ce se stvari vracati iz servisa u odgovarajuci kontroler

class AuthService {

    private static let _singleton = AuthService()
    
    static var singleton: AuthService {
        return _singleton
    }
    
    func login(email:String, password: String, onComplete: Completion?) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                if let errorCode = FIRAuthErrorCode(rawValue: error!._code) {
                    if errorCode == .errorCodeUserNotFound {
                        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                //show error to the user
                                self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                            } else {
                                if user?.uid != nil {
                                    
                                    DataService.singleton.saveUser(uid: user!.uid)
                                    
                                    //Sign in
                                    FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if error != nil {
                                            //show error to the user
                                            self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                                        } else {
                                            //successfully logged in
                                            onComplete?(nil,user)
                                        }
                                    })
                                }
                            }
                        })
                    }
                } else {
                    //handle all of the other error types
                    self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                }
            } else {
                //successfully logged in
                onComplete?(nil,user)
            }
        })
    }
    
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
        print(error.debugDescription)
        if let errorCode = FIRAuthErrorCode(rawValue: error._code) {
            switch errorCode {
            case .errorCodeInvalidEmail:
                onComplete?("Invalid email address!",nil)
                break
            case .errorCodeWrongPassword:
                onComplete?("Invalid password!",nil)
                break
            case .errorCodeEmailAlreadyInUse, .errorCodeAccountExistsWithDifferentCredential:
                onComplete?("Email already in use!",nil)
            default:
                onComplete?("Problem with auth, try again!",nil)
            }
        }
    }
}
