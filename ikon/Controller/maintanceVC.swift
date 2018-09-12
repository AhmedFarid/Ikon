//
//  maintanceVC.swift
//  ikon
//
//  Created by FARIDO on 9/2/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class maintanceVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //outLets.......................................
    @IBOutlet weak var servicePikerView: UIPickerView!
    @IBOutlet weak var modelPikerView: UIPickerView!
    @IBOutlet weak var colorPikerView: UIPickerView!
    @IBOutlet weak var issuePikerview: UIPickerView!
    @IBOutlet weak var otherIssueTF: UITextField!
    //outLets.......................................
    //data..........................................
    
    var productId = ""
    var issueId = ""
    var type = ""
    var colorsent = ""
    
    var price = [issuePriceAPI]()
    
    var service = ["visit",
                   "maintenance"
    ]
    var color = ["White",
                 "Red",
                 "Gold",
                 "Silver",
                 "Black"
    ]
    var model = [maintanceAPI]()
    var issue = [isuueAPI]()
    //data..........................................
    override func viewDidLoad() {
        super.viewDidLoad()
        handelRefreshIssue()
        handelRefresh()
    }
    fileprivate func handelRefreshIssue() {
        API.issueList { (error: Error?, issuee: [isuueAPI]?) in
            if let issues = issuee {
                //print("here3 \(issues)")
                self.issue = issues
                self.issuePikerview.reloadAllComponents()
            }
        }
        
    }
    fileprivate func handelRefresh() {
        API.productList { (error: Error?, prodect: [maintanceAPI]?) in
            if let prodects = prodect {
                //print("here \(prodects)")
                self.model = prodects
                self.modelPikerView.reloadAllComponents()
                
            }
        }
    }
    //Actions.......................................
    @IBAction func getPrice(_ sender: Any) {
        
        let apiToken = "11"
        APIGetPrice.getPrice(apiToken: apiToken, productId: productId, issueId: issueId, type: type) { (error: Error?, pricee: [issuePriceAPI]?) in
            if let prices = pricee {
                print("pricr\(prices)")
                self.price = prices
                print("last  \(self.price)")
            }else {
                print("Error in price")
            }
        }
        performSegue(withIdentifier: "getPrice", sender: price)
    }
    //Actions.......................................
    
    //pikerviewFuncs................................
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 0 {
            return 1
        }else if pickerView.tag == 1 {
            return 1
        }else if pickerView.tag == 2{
            return 1
        }else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0 {
        return service.count
        }else if pickerView.tag == 1 {
            return model.count
        }else if pickerView.tag == 2 {
            return color.count
        }else {
            return issue.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
        return service[row]
        }else if pickerView.tag == 1 {
            return model[row].productsName
        }else if pickerView.tag == 2 {
            return color[row]
        }else {
            return issue[row].issueType
        }
    }
    //pikerviewFuncs................................
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            self.type = service[row]
            print(type)
        }else if pickerView.tag == 1 {
            self.productId = model[row].productsId
            print(productId)
        }else if pickerView.tag == 2 {
            self.colorsent = color[row]
            print(colorsent)
        }else {
            self.issueId = issue[row].issueId
            print(issueId)
        }
        
    }
    
    
}
