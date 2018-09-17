//
//  sparPartsCell.swift
//  ikon
//
//  Created by FARIDO on 9/17/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit

class sparPartsCell: UICollectionViewCell {
    
    @IBOutlet weak var sparPartImage: UIImageView!
    @IBOutlet weak var sparPartName: UILabel!
    @IBOutlet weak var sparPartPrice: UILabel!
    
    func configuerCell(sparpart: SparParts) {
        sparPartName.text = sparpart.productsName
        sparPartPrice.text = sparpart.productsPrice
        sparPartImage.kf.indicatorType = .activity
        if let url = URL(string: "http://ikongo.com/site/\(sparpart.productsImage)"){
            sparPartImage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
}
