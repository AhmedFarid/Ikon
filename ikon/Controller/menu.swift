//
//  shopingVC.swift
//  ikon
//
//  Created by FARIDO on 9/2/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit

class menu: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func orderShop(_ sender: Any) {
        self.performSegue(withIdentifier: "getinfo", sender: nil)
    }
    
    @IBAction func orderMaint(_ sender: Any) {
    }
}
