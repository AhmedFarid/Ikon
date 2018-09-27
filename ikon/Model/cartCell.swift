//
//  cartCell.swift
//  ikon
//
//  Created by FARIDO on 9/23/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit
import CoreData
import Kingfisher

class cartCell: UITableViewCell {

    @IBOutlet weak var prodactPrice: UILabel!
    @IBOutlet weak var brodactDes: UILabel!
    @IBOutlet weak var prodactName: UILabel!
    @IBOutlet weak var prodactImage: UIImageView!
    
    var deleteAction: (() -> Void)?
    
    func configuerCell (cart: Cart) {
        prodactName.text = cart.productName
        prodactPrice.text = cart.productPrice
        brodactDes.text = cart.productDes
        print("des \(brodactDes)")
        
        prodactImage.kf.indicatorType = .activity
        if let url = URL(string: "http://ikongo.com/site/\(cart.productImage ?? "")"){
            //print(url)
            prodactImage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        deleteAction?()
    }
}
