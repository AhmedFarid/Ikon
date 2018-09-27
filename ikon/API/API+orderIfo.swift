//
//  API+orderIfo.swift
//  ikon
//
//  Created by FARIDO on 9/27/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension API {
    
    class func getMaintInfo(completion: @escaping (_ error: Error?, _ productList: [getMaintInf]?)->Void) {
        let url = URLs.getMaintenanceInfo
        guard let userToken = helper.getApiToken() else {
            completion(nil,nil)
            return
        }
        
        let api_token = "11"
        let lang = "ar"
        
        let parameters = [
            "api_token" : api_token,
            "lang" : lang,
            "user_token" : userToken
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                
                switch response.result
                {
                case .failure(let error):
                    print(error)
                    completion(error, nil)
                    print(error)
                    
                case .success(let value):
                    let json = JSON(value)
                    
                    guard let dataArray = json["data"]["MaintenanceOrder"].array else {
                        completion(nil , nil)
                        return
                    }
                    //print("1 \(dataArray)")
                    var productList = [getMaintInf]()
                    for products in dataArray {
                        if let  products = products.dictionary, let prodecta = getMaintInf.init(dict: products) {
                            productList.append(prodecta)
                            //print("1 \(prodecta)")
                        }
                    }
                    completion(nil, productList)
                }
        }
        
    }
        
}
