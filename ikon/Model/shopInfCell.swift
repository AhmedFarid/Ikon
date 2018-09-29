//
//  shopInfCell.swift
//  ikon
//
//  Created by FARIDO on 9/27/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit

class shopInfCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var orederprice: UILabel!
    
    func configerCell(shop: getShopInfo) {
        name.text = shop.customersName
        address.text = shop.customersStreetAddress
        phone.text = shop.customersTelephone
        email.text = shop.email
        orederprice.text = shop.orderPrice
    }
}
