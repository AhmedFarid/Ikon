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
                    print("phonesData \(json)")
                    
                    guard let dataArray = json["data"]["products"].array else {
                        completion(nil , nil)
                        return
                    }
                    print("PhonesData2 \(dataArray)")
                    var productList = [Phone]()
                    for products in dataArray {
                        if let  products = products.dictionary, let prodecta = Phone.init(dict: products) {
                            productList.append(prodecta)
                            print("PhonesData3 \(prodecta)")
                        }
                    }
                    completion(nil, productList)
                }
        }
        
    }
}
