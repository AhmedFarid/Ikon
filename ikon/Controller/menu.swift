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
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "getInfo")
        let nav = UINavigationController(rootViewController: vc)
        if let vcs = self.revealViewController() {
            vcs.pushFrontViewController(nav, animated: true)
            
        }
        //self.performSegue(withIdentifier: "getinfo", sender: nil)
    }
    
    @IBAction func orderMaint(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "INFO")
        let nav = UINavigationController(rootViewController: vc)
        if let vcs = self.revealViewController() {
            vcs.pushFrontViewController(nav, animated: true)
            
        }
        //self.performSegue(withIdentifier: "getinfo", sender: nil)
    }
    
    
}
