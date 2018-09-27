//  API+Mantince.swift
//  ikon
//
//  Created by FARIDO on 9/7/18.
//  Copyright © 2018 FARIDO. All rights reserved.
import Foundation
import Alamofire
import SwiftyJSON

extension API {
    
    class func productList(prodactId: String, completion: @escaping (_ error: Error?, _ productList: [maintanceAPI]?)->Void) {
        let url = URLs.getListProducts
        
        let api_token = "11"
        let lang = "ar"
        
        let parameters = [
            "api_token" : api_token,
            "lang" : lang,
            "product_id":prodactId
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
                    
                    guard let dataArray = json["data"]["SpareParts"].array else {
                        completion(nil , nil)
                        return
                    }
                    //print("1 \(dataArray)")
                    var productList = [maintanceAPI]()
                    for products in dataArray {
                        if let  products = products.dictionary, let prodecta = maintanceAPI.init(dict: products) {
                            productList.append(prodecta)
                            //print("1 \(prodecta)")
                        }
                    }
                    completion(nil, productList)
                }
        }

}
    class func issueList(completion: @escaping (_ error: Error?, _ productList: [isuueAPI]?)->Void) {
        let url = URLs.getListIssueType
        
        let api_token = "11"
        let lang = "ar"
        
        let parameters = [
            "api_token" : api_token,
            "lang" : lang
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                
                switch response.result
                {
                case .failure(let error):
                    //print(error)
                    completion(error, nil)
                    //print(error)
                    
                case .success(let value):
                    let json = JSON(value)
                    
                    guard let dataArray = json["data"]["issueType"].array else {
                        completion(nil , nil)
                        return
                    }
                    
                    
                    //print("new \(dataArray)")
                    var issueList = [isuueAPI]()
                    for data in dataArray {
                        if let data = data.dictionary, let issue = isuueAPI.init(dict: data) {
                            issueList.append(issue)
                            //print("new2 \(issue)")
                        }
                        
                    }
                    completion(nil, issueList)
                }
        }
    }
    
    class func colorList(completion: @escaping (_ error: Error?, _ colorLists: [colorAPI]?)->Void) {
        let url = URLs.getColorList
        
        let api_token = "11"
        let lang = "ar"
        
        let parameters = [
            "api_token" : api_token,
            "lang" : lang
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                
                switch response.result
                {
                case .failure(let error):
                    print("color \(error)")
                    completion(error, nil)
                    print("color \(error)")
                    
                case .success(let value):
                    let json = JSON(value)
                    
                    guard let dataArray = json["data"]["color"].array else {
                        completion(nil , nil)
                        return
                    }
                    
                    
                    print("color 1 \(dataArray)")
                    var colorlist = [colorAPI]()
                    for data in dataArray {
                        if let data = data.dictionary, let color = colorAPI.init(dict: data) {
                            colorlist.append(color)
                            print("color2 \(color)")
                        }
                        
                    }
                    completion(nil, colorlist)
                }
        }
    }
}


