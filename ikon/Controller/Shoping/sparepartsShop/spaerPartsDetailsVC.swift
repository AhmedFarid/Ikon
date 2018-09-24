//
//  spaerPartsDetailsVC.swift
//  ikon
//
//  Created by FARIDO on 9/17/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit

class spaerPartsDetailsVC: UIViewController {
    
    var singelItem: SparParts?

    @IBOutlet weak var sparImage: UIImageView!
    @IBOutlet weak var sparname: UILabel!
    @IBOutlet weak var sparDisc: UILabel!
    @IBOutlet weak var sparPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sparname.text = singelItem?.productsName
        sparDisc.text = singelItem?.productsDescription
        sparPrice.text = (singelItem?.productsPrice)!+" SR"
        
        sparImage.kf.indicatorType = .activity
        if let url = URL(string: "http://ikongo.com/site/"+(singelItem?.productsImage)!){
            //print(url)
            sparImage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        
    }
        

    
    
    @IBAction func addToCart(_ sender: Any) {
    }
}
