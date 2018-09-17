//
//  accessoriesCell.swift
//  ikon
//
//  Created by FARIDO on 9/17/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit
import Kingfisher

class accessoriesCell: UICollectionViewCell {
    @IBOutlet weak var accersoresImage: UIImageView!
    @IBOutlet weak var accerssorsName: UILabel!
    @IBOutlet weak var accerssoresPrice: UILabel!
    
    
     func configuerCell(accessories: Accessores) {
        accerssorsName.text = accessories.productsName
        accerssoresPrice.text = accessories.productsPrice
        accersoresImage.kf.indicatorType = .activity
        if let url = URL(string: "http://ikongo.com/site/\(accessories.productsImage)"){
            accersoresImage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        
    }
}
