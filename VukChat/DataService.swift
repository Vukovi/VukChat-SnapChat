//
//  DataService.swift
//  VukChat
//
//  Created by Vuk on 5/1/17.
//  Copyright © 2017 Vuk. All rights reserved.
//

import Foundation
import Firebase

class DataService {

    private static let _singleton = DataService()
    
    static var singleton: DataService {
        return _singleton
    }
    
    var mainReference: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    func saveUser(uid: String) {
        let profile: Dictionary<String,AnyObject> = ["firstName": "" as AnyObject, "lastName": "" as AnyObject]
        mainReference.child("users").child(uid).child("profile").setValue(profile)
    }
}
