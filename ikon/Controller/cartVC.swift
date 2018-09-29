//
//  cartVC.swift
//  ikon
//
//  Created by FARIDO on 9/23/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit
import CoreData

class cartVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tabelView: UITableView!
    
    var carts = [Cart]()
    var delete: Cart?
    var totalPrice = 0.0
    var productsString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tabelView.dataSource = self
        tabelView.delegate = self
        
        loadCarts()
        getData()
    }
    
    func getData() {
        for i in carts {
            self.productsString = ("\(self.productsString + i.productId! + ",")")
            self.totalPrice = self.totalPrice + Double(i.productPrice ?? "")!
        }
        print(productsString)
        print(totalPrice)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tabelView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as? cartCell{
            let cart = carts[indexPath.row]
            cell.configuerCell(cart: cart)
            cell.deleteAction = {
                // delete row
                
                self.carts.remove(at: indexPath.row)
                // delete from core data
                if self.delete != nil {
                tableView.beginUpdates()
                context.delete(self.delete!)
                ad.saveContext()
                    tableView.endUpdates()
                    tableView.reloadData()
                }
                
                tableView.endUpdates()
                tableView.reloadData()
            }
            return cell
        }else {
            return cartCell()
        }
        
    }
    
    @IBAction func requestOrder(_ sender: Any) {
        guard (helper.getApiToken() != nil)  else {
            let message = NSLocalizedString("please login frist", comment: "hhhh")
            self.showAlert(title: "Filed to request order", message: message)
            return
        }
        
        guard self.totalPrice != 0.0 else {
            self.showAlert(title: "Filed to request order", message: "Add somthing to cart frist")
            return
        }
        self.performSegue(withIdentifier: "getData", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let locationVC = segue.destination as? shopingLocationVC else { return }
        locationVC.totalPrice = Int(totalPrice)
        locationVC.products = productsString
    }
    
    
    func loadCarts() {
        let fetchRequest:NSFetchRequest<Cart> = Cart.fetchRequest()
        do{
            carts = try context.fetch(fetchRequest)
            tabelView.reloadData()
        } catch{
            print(error)
        }
    }
}
