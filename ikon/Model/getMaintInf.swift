//
//  getMaintInf.swift
//  ikon
//
//  Created by FARIDO on 9/27/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit
import SwiftyJSON

class getMaintInf: NSObject {
    var customersFirstname: String
    var customersLastname: String
    var type: String
    var sparePart: String
    var color: String
    var issue: String
    var note: String
    var orderDate: String
    var price: String
    
    init?(dict: [String: JSON]) {
        guard let customersFirstname = dict["customers_firstname"]?.string, let customersLastname = dict["customers_lastname"]?.string, let type = dict["type"]?.string, let sparePart = dict["sparePart"]?.string, let color = dict["color"]?.string, let issue = dict["issue"]?.string, let note = dict["note"]?.string, let orderDate = dict["orderDate"]?.string, let price = dict["price"]?.string else { return nil}
        
        self.customersFirstname = customersFirstname
        self.customersLastname = customersLastname
        self.type = type
        self.sparePart = sparePart
        self.color = color
        self.issue = issue
        self.note = note
        self.orderDate = orderDate
        self.price = price
    }
}


class getShopInfo: NSObject {
    
    var customersName: String
    var customersStreetAddress: String
    var customersTelephone: String
    var email: String
    var orderPrice: String
    
    init?(dict: [String: JSON]) {
        guard let customersName = dict["customers_name"]?.string, let customersStreetAddress = dict["customers_street_address"]?.string, let customersTelephone = dict["customers_telephone"]?.string, let email = dict["email"]?.string, let orderPrice = dict["order_price"]?.string else { return nil}

        self.customersName = customersName
        self.customersStreetAddress = customersStreetAddress
        self.customersTelephone = customersTelephone
        self.email = email
        self.orderPrice = orderPrice
    }
}


