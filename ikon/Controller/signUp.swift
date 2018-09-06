//
//  signUp.swift
//  ikon
//
//  Created by FARIDO on 9/2/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class signUp: UIViewController {

    
    //Outlets........................................
    @IBOutlet weak var fristName: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var ConfirmPasswordTF: UITextField!
    //Outlets........................................
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Actions........................................
    @IBAction func RegisterBTN(_ sender: Any) {
        guard let fristName = fristName.text, !fristName.isEmpty else { return }
        guard let lastName = lastNameTF.text, !lastName.isEmpty else { return }
        guard let email = emailTF.text?.trimmed, !email.isEmpty else { return }
        if isValidEmail(testStr: email) == false {
            self.showAlert(title: "SignUp Filed", message: "email not correct")
        }
        guard let phone = phoneTF.text?.trimmed, !phone.isEmpty else { return }
        guard let password = passwordTF.text?.trimmed, !password.isEmpty else { return }
        guard let confirmPassword = ConfirmPasswordTF.text?.trimmed, !confirmPassword.isEmpty else { return }
        
        guard password == confirmPassword else { return }
        
        let apiToken = "11"
        
        API.signup(fristName: fristName, lastName: lastName, phone: phone, email: email, password: password, ApiToken: apiToken) { (error: Error?, success: Bool) in
            if success {
                print("SignUP Seccess")
                //move to main Page and save API token
            }else{
                self.showAlert(title: "SignUp Filed", message: "check the your info agine or check networ")
            }
            
        }
    }
    //Actions........................................
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}

