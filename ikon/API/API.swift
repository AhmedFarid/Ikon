//
//  API.swift
//  ikon
//
//  Created by FARIDO on 9/4/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API: NSObject {
    
    
    //Login...........
    
    class func login(email: String, password: String, ApiToken: String, completion: @escaping (_ error: Error?, _ success: Bool)->Void) {
        
        let url = URLs.login
        
        
        let parameters = [
            "email": email,
            "password": password,
            "api_token": ApiToken
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                
                switch response.result
                {
                case .failure(let error):
                    completion(error,false)
    
                case .success(let value):
                    print(value)
                    completion(nil,true)
                    //move you to main home
                }
        }
    }
    
    //signUP...........
    
    class func signup(fristName: String, lastName: String, phone: String, email: String, password: String, ApiToken: String, completion: @escaping (_ error: Error?, _ success: Bool)->Void) {
        
        let url = URLs.signUp
        
        
        let parameters = [
            "firstName": fristName,
            "lastName": lastName,
            "phone": phone,
            "email": email,
            "password": password,
            "api_token": ApiToken
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                
                switch response.result
                {
                case .failure(let error):
                    completion(error,false)
                    
                case .success(let value):
                    print(value)
                    completion(nil,true)
                    //move you to main home
                }
        }
    }
    
}
