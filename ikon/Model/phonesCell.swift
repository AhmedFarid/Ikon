//
//  phonesCell.swift
//  ikon
//
//  Created by FARIDO on 9/16/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit
import Kingfisher

class phonesCell: UICollectionViewCell {
    
    @IBOutlet weak var phoneImage: UIImageView!
    @IBOutlet weak var phoneNamr: UILabel!
    @IBOutlet weak var phonePrice: UILabel!
    
    
    func configuerCell(phone: Phone) {
        phoneNamr.text = phone.productsName
        phonePrice.text = phone.productsPrice
        phoneImage.kf.indicatorType = .activity
        if let url = URL(string: "http://ikongo.com/site/\(phone.productsImage)"){
            phoneImage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        
    }
}
