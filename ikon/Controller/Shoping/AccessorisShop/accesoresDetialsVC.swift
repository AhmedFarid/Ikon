//
//  accesoresDetialsVC.swift
//  ikon
//
//  Created by FARIDO on 9/17/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit

class accesoresDetialsVC: UIViewController {

    var singelItem: Accessores?
    
    @IBOutlet weak var accesIMage: UIImageView!
    @IBOutlet weak var accessoName: UILabel!
    @IBOutlet weak var accessoDIsc: UILabel!
    @IBOutlet weak var AccessoModel: UILabel!
    @IBOutlet weak var accessoPrice: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        accessoName.text = singelItem?.productsName
        accessoDIsc.text = singelItem?.productsDescription
        AccessoModel.text = singelItem?.productsModel
        accessoPrice.text = (singelItem?.productsPrice)!+" SR"
        
        accesIMage.kf.indicatorType = .activity
        if let url = URL(string: "http://ikongo.com/site/"+(singelItem?.productsImage)!){
            //print(url)
            accesIMage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        
    }
    @IBAction func addToCart(_ sender: Any) {
        guard (helper.getApiToken() != nil)  else {
            let message = NSLocalizedString("please login frist", comment: "msg list lang")
            self.showAlert(title: "Filed to Add Cart", message: message)
            return
        }
        let newCart = Cart(context: context)
        newCart.productId = singelItem?.productsId
        newCart.productName = singelItem?.productsName
        newCart.productDes = singelItem?.productsDescription
        newCart.productPrice = (singelItem?.productsPrice)!+" SR"
        newCart.productImage = singelItem?.productsImage
        do{
            ad.saveContext()
            let message = NSLocalizedString("Added to cart successfully go to cart to request order", comment: "msg list lang")
            self.showAlert(title: "Add to cart", message: message)
        } catch {
            print("error in coreData")
        }
    }
}
