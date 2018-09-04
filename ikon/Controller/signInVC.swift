//
//  signInVC.swift
//  ikon
//
//  Created by FARIDO on 9/2/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FBSDKLoginKit
import Alamofire
import SwiftyJSON

class signInVC: UIViewController,FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwwordTF: UITextField!
    
    @IBOutlet weak var faceLogin: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        faceLogin.delegate = self
    }
    //facebook fuctions.................................................
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("loged out")
    }
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if let error = error {
            self.showAlert(title: "Error", message: error.localizedDescription)
        }else {
            let credentials = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            Auth.auth().signIn(with: credentials) { (user: User?,error: Error?) in
                if let error = error {
                    self.showAlert(title: "Error", message: error.localizedDescription)
                } else if let user = user {
                    print(user.providerID)
                    print(user.displayName!)
                    print(user.email!)
                    print(user.uid)
                    print(user.photoURL!)
                    
                    for profile in user.providerData {
                        print(profile.providerID)
                        print(profile.displayName!)
                        print(profile.email!)
                        print(profile.uid)
                        print(profile.photoURL!)
                        
                    }
                    
                    
                }
            }
        }
        
    }
    
    
    
    //Actions..................................................
    
    @IBAction func signinBTN(_ sender: Any) {
        guard let email = emailTF.text, !email.isEmpty else { return }
        guard let paswword  = passwwordTF.text, !paswword.isEmpty else { return }
        let Api_token = "11"
        
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
    
    
}
