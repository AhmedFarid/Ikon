//
//  API+Orders.swift
//  ikon
//
//  Created by FARIDO on 9/21/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_Orders: NSObject {
    
    class func maintenanceOrder(apiToken: String, sparePart: String, type: String, color: String, note: String, address: String, latitude: String, longitude: String, price: String, issue: String , phone: String,product_id: String ,completion: @escaping (_ error: Error?, _ success: Bool)->Void){
        
        let url = URLs.orderMaintenance
        guard let userToken = helper.getApiToken() else {
            completion(nil,false)
            return
        }
        
        let parameters = [
            "api_token": apiToken,
            "user_token": userToken,
            "sparePart": sparePart,
            "type": type,
            "color": color,
            "note": note,
            "address": address,
            "latitude": latitude,
            "longitude": longitude,
            "price": price,
            "issue": issue,
            "phone": phone,
            "product_id": product_id
        ]
        
        print("orderpar\(parameters)")
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                
                switch response.result
                {
                case .failure(let error):
                    print("order \(error)")
                    completion(error,false)
                    print("order \(error)")
                    
                case .success(let value):
                    print(value)
                    completion(nil,true)
                }
        }
    }
    
    class func shopOrder(address: String, latitude: String, longitude: String, phone: String, total_price: String, products: String , completion: @escaping (_ error: Error?, _ success: Bool)->Void){
        
        let apiToken = "11"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let postCode = "1111"
        let city = "city"
        let country = "country"
        let url = URLs.shopOrder
        guard let userToken = helper.getApiToken() else {
            completion(nil,false)
            return
        }
        
        let parameters = [
           
            "api_token": apiToken,
            "address": address,
            "latitude": latitude,
            "longitude": longitude,
            "user_token": userToken,
            "lang": lang,
            "phone": phone,
            "total_price": total_price,
            "products": products,
            "postcode": postCode,
            "city": city,
            "country": country
        ]
        
        print("orderparShop\(parameters)")
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                
                switch response.result
                {
                case .failure(let error):
                    print("order \(error)")
                    completion(error,false)
                    print("order \(error)")
                    
                case .success(let value):
                    print(value)
                    completion(nil,true)
                }
        }
    }
}

