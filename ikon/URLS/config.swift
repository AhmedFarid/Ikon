//
//  config.swift
//  ikon
//
//  Created by FARIDO on 9/4/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import Foundation

typealias DownloadComplete = () -> ()

struct URLs {
    
    static let main = "http://ikongo.com/site/api/"
    
    static let login = main + "login"
    
    static let signUp = main + "signupMobile"
    
    static let getListProducts = main + "sparePartsList"
    
    static let getListIssueType = main + "issueTypeList"
    
    static let getColorList = main + "colorList"
    
    static let getListIssuePrice = main + "issuePrice"
    
    static let getPhonesData = main + "showProductShop"
    
    static let getAceessorisData = main + "showAccessoriesShop"
    
    static let getSparePartsData = main + "showSparePartsShop"
    
    static let orderMaintenance = main + "maintenanceOrder"
    
}
