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
    @IBOutlet weak var phonePikerView: UIPickerView!
    @IBOutlet weak var noteTF: UITextView!
    //outLets.......................................
    //data..........................................
    
    var productId = ""
    var issueId = "any"
    var type = "visit"
    var colorsent = "any"
    var phoneId = ""
    
    var price = 0
    
    var service = ["visit",
                   "maintenance"
    ]
    
    var color = [colorAPI]()
    var model = [maintanceAPI]()
    var issue = [isuueAPI]()
    var phone = [Phone]()
    //data..........................................
    override func viewDidLoad() {
        super.viewDidLoad()
        handelRefreshcolor()
        handelRefreshIssue()
        //handelRefresh()
        handelRefreshphones()
        print(price)
    }
    
    fileprivate func handelRefreshphones() {
        API.getPhoneData { (error: Error?, phones: [Phone]?) in
            if let phoness = phones {
                self.phone = phoness
                self.phonePikerView.reloadAllComponents()
            }
        }
    }
    
    fileprivate func handelRefreshcolor() {
        API.colorList { (error: Error?, colors: [colorAPI]?) in
            if let coloerss = colors {
                //print("here3 \(issues)")
                self.color = coloerss
                self.colorPikerView.reloadAllComponents()
            }
        }
        
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
        API.productList(prodactId: phoneId) { (error: Error?, prodect: [maintanceAPI]?) in
            if let prodects = prodect {
                print("here \(prodects)")
                self.model = prodects
                self.modelPikerView.reloadAllComponents()
                
            }
        }
    }
    //Actions.......................................
    @IBAction func getPrice(_ sender: Any) {
        guard let note = noteTF.text, !note.isEmpty else {
            let message = NSLocalizedString("enter any other issue description", comment: "msg list lang")
            self.showAlert(title: "Order Filed", message: message)
            return
        }
        
        let apiToken = "11"
        APIGetPrice.getPrice(apiToken: apiToken, productId: productId, productphoneId: phoneId, type: type) { (error, price) in
            if error == nil {
                self.price = price!
                print("aa  \(self.price)")
                self.performSegue(withIdentifier: "getPrice", sender: price)
            }
        }
    }
    //Actions.......................................
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let MaintanceLocationVC = segue.destination as? maintanceLocationVC else { return }
        MaintanceLocationVC.priceValue = sender as! Int
        MaintanceLocationVC.color = colorsent 
        MaintanceLocationVC.type = type 
        MaintanceLocationVC.sparePart = productId 
        MaintanceLocationVC.issue = issueId
        MaintanceLocationVC.productId = phoneId
        if let not = noteTF.text{
        MaintanceLocationVC.note = not
        }
    }
    //pikerviewFuncs................................
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 0 {
            return 1
        } else if pickerView.tag == 1 {
            return 1
        } else if pickerView.tag == 2{
            return 1
        } else if pickerView.tag == 5 {
            return 1
        }
        else {
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
        }else if pickerView.tag == 5{
            return phone.count
        }
        else {
            return issue.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
        return service[row]
        }else if pickerView.tag == 1 {
            return model[row].productsName
        }else if pickerView.tag == 2 {
            return color[row].color
        }else if pickerView.tag == 5 {
            return phone[row].productsName
        }
        else {
            return issue[row].issueType
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            self.type = service[row]
            print(type)
        }else if pickerView.tag == 1 {
            self.productId = model[row].productsId
            print(productId)
        }else if pickerView.tag == 2 {
            self.colorsent = color[row].color
            print(colorsent)
        }else if pickerView.tag == 5 {
            self.phoneId = phone[row].productsId
            handelRefresh()
            print(phoneId)
        }
        else {
            self.issueId = issue[row].issueType
            print(issueId)
        }
    }
    //pikerviewFuncs................................
}
