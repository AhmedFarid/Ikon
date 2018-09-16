//
//  API+Phones.swift
//  ikon
//
//  Created by FARIDO on 9/16/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit
import Alamofire

class phones {
    var _phoneName: String!
    var _phoneDescription: String!
    var _phoneModel: String!
    var _phoneImage: String!
    var _phonePrice: String!
    
    var phoneName: String {
        if _phoneName == nil {
            _phoneName = ""
        }
        return _phoneName
    }
    
    var phoneDescription: String {
        if _phoneDescription == nil {
            _phoneDescription = ""
        }
        return _phoneDescription
    }
    
    var phoneModel: String {
        if _phoneModel == nil {
            _phoneModel = ""
        }
        return _phoneModel
    }
    
    var phoneImage: String {
        if _phoneImage == nil {
            _phoneImage = ""
        }
        return _phoneImage
    }
    
    var phonePrice: String {
        if _phonePrice == nil {
            _phonePrice = ""
        }
        return _phonePrice
    }
    
}
