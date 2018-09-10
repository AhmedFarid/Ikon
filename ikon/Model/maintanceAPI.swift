//
//  maintanceAPI.swift
//  ikon
//
//  Created by FARIDO on 9/7/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit
import SwiftyJSON

class maintanceAPI: NSObject {
    
    var productsId: String
    var productsName: String
    
    init?(dict: [String: JSON]) {
        guard let productsId = dict["products_id"]?.string, let productsName = dict["products_name"]?.string else { return nil }
        
        self.productsId = productsId
        self.productsName = productsName
    }
}

class isuueAPI: NSObject {
    
    var issueId: String
    var issueType: String
    
    init?(dict: [String: JSON]) {
        guard let issueId = dict["id"]?.string, let issueType = dict["name_type_ar"]?.string else { return nil}
        
        self.issueId = issueId
        self.issueType = issueType
    }
}



