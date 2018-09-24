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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelView.dataSource = self
        tabelView.delegate = self
        
        loadCarts()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tabelView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as? cartCell{
            let cart = carts[indexPath.row]
            cell.configuerCell(cart: cart)
            return cell
        }else {
            return cartCell()
        }
        
    }
    
    func loadCarts() {
        let fetchRequest:NSFetchRequest<Cart> = Cart.fetchRequest()
        do{
            carts = try context.fetch(fetchRequest)
            tabelView.reloadData()
        } catch{
            
        }
    }
    
    
}
