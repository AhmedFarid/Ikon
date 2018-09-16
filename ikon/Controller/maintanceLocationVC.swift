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
    
    
    var priceValue = 0
    var apiToken = "11"
    var sparePart = ""
    var type = ""
    var color = ""
    var note = ""
    var issue = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        priceLabel.text = "Price: \(priceValue)"
    }
}
