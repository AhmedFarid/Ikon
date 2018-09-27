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
    // POST
    class func POST(url: String, parameters: [String:Any], header: [String:Any]?, completion: @escaping (_ success: Bool, _ result: [String:AnyObject]?) -> Void) {
        
        request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header as? HTTPHeaders).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                    print(error)
                completion(false, nil)
            case .success(let value):
                print(value)
                completion(true, value as? [String:AnyObject])
            }
        }
    }
    
    class func getPrice(apiToken: String, productId: String, productphoneId: String, type: String, completion: @escaping (_ error: Error?, _ priceVA: Int?)-> Void) {
        
        let parameters = [
            "api_token": apiToken,
            "sparePart": productId,
            "product_id": productphoneId,
            "type": type
        ]

        print("aaaaa \(parameters)")
        // Call API
        Alamofire.request(URLs.getListIssuePrice, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result
                {
                case .failure(let error):
                    completion(error, nil)
                    print("error  \(error)")
                case .success(let value):
                    print(value)
                    let result = value as! [String:AnyObject]
                    if let status = result["status"] as? Int {
                        switch status {
                        case 1:
                            if let data = result["data"] as? [String:AnyObject] {
                                let message = data["message"] as? String ?? ""
                                print(message)
                                let price = data["price"] as? Int ?? 0
                                completion(nil, price)
                                print("aa \(price)")
                            }
                        case 0:
                            print("faluire")
                        default:
                            break
                        }
                }
            }
        }
    }
}
//                    let json = JSON(value)
//                    print("price1 \(value)")
//                    guard let priceVA = json["data"]["price"].int else {
//                        completion(nil, nil)
//                        return
//                    }
//                    print("price 2 \(priceVA)")
//                    var pricees = [issuePriceAPI]()
//                    let data = issuePriceAPI.init()
//                    let dataprice = priceVA
//                    data.price = dataprice
//                    pricees.append(data)
//                    if let price = json["data"]["price"].string {
//                        print("price2 \(price)")
//                        var pricees = [issuePriceAPI]()
//                        let prices = issuePriceAPI()
//                        prices.price = price
//                        pricees.append(prices)
//                        completion(nil, pricees)
//}


