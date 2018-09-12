//
//  API+getPrice.swift
//  ikon
//
//  Created by FARIDO on 9/10/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIGetPrice: NSObject {
    
    class func getPrice(apiToken: String, productId: String, issueId: String, type: String, completion: @escaping (_ error: Error?, _ price: [issuePriceAPI]?)-> Void) {
        
        let url = URLs.getListIssuePrice
        
        let parameters = [
            "api_token": apiToken,
            "product_id": productId,
            "issue_id": issueId,
            "type": type
        ]
        
        print("aaaaa \(parameters)")
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                
                switch response.result
                {
                case .failure(let error):
                    completion(error, nil)
                    print(error)
                    
                case .success(let value):
                    let json = JSON(value)
                    print("price1 \(value)")
                    if let price = json["data"]["price"].string {
                        print("price2 \(price)")
                        var pricees = [issuePriceAPI]()
                        let prices = issuePriceAPI()
                        prices.price = price
                        pricees.append(prices)
                        completion(nil, pricees)
                }
            }
        }
    }
}

