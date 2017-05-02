//
//  LoginVC.swift
//  VukChat
//
//  Created by Vuk on 4/30/17.
//  Copyright © 2017 Vuk. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var passwordField: RoundTextField!
    @IBOutlet weak var emailField: RoundTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailField.text, let pass = passwordField.text, (emailField.text!.characters.count > 0 && passwordField.text!.characters.count > 0) {
        
            //Call the login service
            AuthService.singleton.login(email: email, password: pass, onComplete: { (errMsg, data) in
                guard errMsg == nil else {
                    let alert = UIAlertController(title: "Greska", message: errMsg, preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
            })
        } else {
            let alert = UIAlertController(title: "Korisnicko ime i lozinka su neophodni!", message: "Unesite kosisnicko ime i lozinku!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }


}
