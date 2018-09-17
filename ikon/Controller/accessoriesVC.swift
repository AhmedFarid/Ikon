//
//  accessoriesVC.swift
//  ikon
//
//  Created by FARIDO on 9/16/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit
import Alamofire

class accessoriesVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var accessorersVC: UICollectionView!
    
    var accessorers = [Accessores]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        accessorersVC.delegate = self
        accessorersVC.dataSource = self
        accersosHanleRefresh()
        
    }
    
    private func accersosHanleRefresh() {
        API.getAcceroesData{ (error: Error?, accessorers: [Accessores]?) in
            
            if let accessorers = accessorers {
                self.accessorers = accessorers
                self.accessorersVC.reloadData()
                print("phoneslast \(accessorers)")
            }
            
        }
    }
    
    
    
    //collectionView Func..............................................phoneCell
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return accessorers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = accessorersVC.dequeueReusableCell(withReuseIdentifier: "accessoresCell", for: indexPath) as? accessoriesCell {
            let accessore = accessorers[indexPath.row]
            cell.configuerCell(accessories: accessore)
            return cell
        }else {
            return accessoriesCell()
        }
        
    }
    
    
    //collectionView Func..............................................phoneCell
}
