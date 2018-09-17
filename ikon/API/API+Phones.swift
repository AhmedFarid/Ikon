import Foundation
import Alamofire
import SwiftyJSON

extension API {
    
    class func getPhoneData(completion: @escaping (_ error: Error?,_ phones: [Phone]?)-> Void) {
        let url = URLs.getPhonesData
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
                    print(error)
                    completion(error, nil)
                    print(error)
                    
                case .success(let value):
                    let json = JSON(value)
                    //print("phonesData \(json)")
                    
                    guard let dataArray = json["data"]["products"].array else {
                        completion(nil , nil)
                        return
                    }
                    //print("PhonesData2 \(dataArray)")
                    var productList = [Phone]()
                    for products in dataArray {
                        if let  products = products.dictionary, let prodecta = Phone.init(dict: products) {
                            productList.append(prodecta)
                           // print("PhonesData3 \(prodecta)")
                        }
                    }
                    completion(nil, productList)
                }
        }
        
    }
    
    class func getAcceroesData(completion: @escaping (_ error: Error?,_ acceroes: [Accessores]?)-> Void) {
        let url = URLs.getAceessorisData
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
                    print(error)
                    completion(error, nil)
                    print(error)
                    
                case .success(let value):
                    let json = JSON(value)
                    //print("Accessors \(json)")
                    
                    guard let dataArray = json["data"]["products"].array else {
                        completion(nil , nil)
                        return
                    }
                    //print("Accessors2 \(dataArray)")
                    var productList = [Accessores]()
                    for products in dataArray {
                        if let  products = products.dictionary, let prodecta = Accessores.init(dict: products) {
                            productList.append(prodecta)
                            //print("Accessors3 \(prodecta)")
                        }
                    }
                    completion(nil, productList)
                }
        }
    }
    
    class func getSparPartsData(completion: @escaping (_ error: Error?,_ sparparts: [SparParts]?)-> Void) {
        let url = URLs.getSparePartsData
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
                    print(error)
                    completion(error, nil)
                    print(error)
                case .success(let value):
                    let json = JSON(value)
                    print("spar \(json)")
                    
                    guard let dataArray = json["data"]["products"].array else {
                        completion(nil , nil)
                        return
                    }
                    print("spar \(dataArray)")
                    var productList = [SparParts]()
                    for products in dataArray {
                        if let  products = products.dictionary, let prodecta = SparParts.init(dict: products) {
                            productList.append(prodecta)
                            print("PhonesData3 \(prodecta)")
                        }
                    }
                    completion(nil, productList)
                }
        }
        
    }
}
