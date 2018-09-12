//
//  maintanceLocationVC.swift
//  ikon
//
//  Created by FARIDO on 9/3/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit

class maintanceLocationVC: UIViewController {
    
    @IBOutlet weak var priceLabel: UILabel!
    
    var pricess: issuePriceAPI!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pricess = issuePriceAPI()
        
        priceLabel.text = pricess.price
    }
}
