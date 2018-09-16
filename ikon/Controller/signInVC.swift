//
//  signInVC.swift
//  ikon
//
//  Created by FARIDO on 9/2/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class signInVC: UIViewController{
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwwordTF: UITextField!
    
    @IBOutlet weak var faceLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //facebook fuctions.................................................
    //Actions..................................................
    
    @IBAction func signinBTN(_ sender: Any) {
        guard let email = emailTF.text, !email.isEmpty else { return }
        guard let paswword  = passwwordTF.text, !paswword.isEmpty else { return }
        let Api_token = "123"
        let parms = [
            "email": email,
            "password": paswword,
            "api_token": Api_token
        ]
//        APIGetPrice.POST(url: URLs.login, parameters: parms, header: nil) { (success, result) in
//            if success {
//
//            } else {
//              print("Internet bad conecction")
//            }
//        }
        API.login(email: email, password: paswword, ApiToken: Api_token) { (error: Error?, success: Bool) in
            if success{
                //go to main page
            }else {
                //messageBox
                self.showAlert(title: "email or password is incorrect or you not registered", message: "check the email and password or check networ")

            }
        }
    }
    
    
    @IBAction func faceLoginBTN(_ sender: Any) {
    }
    //Actions..................................................
    
}
