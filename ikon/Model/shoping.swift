//
//  shoping.swift
//  ikon
//
//  Created by FARIDO on 9/16/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import Foundation
import SwiftyJSON

class Phone: NSObject {
    
    var productsId: String
    var productsName: String
    var productsDescription: String
    var productsModel: String
    var productsImage: String
    var productsPrice: String

    init?(dict: [String: JSON]) {
        guard let productsId = dict["products_id"]?.string, let productsName = dict["products_name"]?.string, let productsDescription = dict["products_description"]?.string, let productsModel = dict["products_model"]?.string, let productsImage = dict["products_image"]?.string, let productsPrice = dict["products_price"]?.string  else { return nil}
        
        self.productsId = productsId
        self.productsName = productsName
        self.productsDescription = productsDescription
        self.productsModel = productsModel
        self.productsImage = productsImage
        self.productsPrice = productsPrice
    }
}

class Accessores: NSObject {
    
    var productsId: String
    var productsName: String
    var productsDescription: String
    var productsModel: String
    var productsImage: String
    var productsPrice: String
    
    init?(dict: [String: JSON]) {
        guard let productsId = dict["products_id"]?.string, let productsName = dict["products_name"]?.string, let productsDescription = dict["products_description"]?.string, let productsModel = dict["products_model"]?.string, let productsImage = dict["products_image"]?.string, let productsPrice = dict["products_price"]?.string  else { return nil}
        
        self.productsId = productsId
        self.productsName = productsName
        self.productsDescription = productsDescription
        self.productsModel = productsModel
        self.productsImage = productsImage
        self.productsPrice = productsPrice
    }
}

class SparParts: NSObject {
    
    var productsId: String
    var productsName: String
    var productsDescription: String
    var productsModel: String
    var productsImage: String
    var productsPrice: String
    
    init?(dict: [String: JSON]) {
        guard let productsId = dict["products_id"]?.string, let productsName = dict["products_name"]?.string, let productsDescription = dict["products_description"]?.string, let productsModel = dict["products_model"]?.string, let productsImage = dict["products_image"]?.string, let productsPrice = dict["products_price"]?.string  else { return nil}
        
        self.productsId = productsId
        self.productsName = productsName
        self.productsDescription = productsDescription
        self.productsModel = productsModel
        self.productsImage = productsImage
        self.productsPrice = productsPrice
    }
}
