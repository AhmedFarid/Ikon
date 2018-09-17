//
//  sparepartsVC.swift
//  ikon
//
//  Created by FARIDO on 9/17/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit

class sparepartsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var sparepartsCollection: UICollectionView!
    
    var sparParts = [SparParts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sparepartsCollection.delegate = self
        sparepartsCollection.dataSource = self
        
        sparHanleRefresh()
    }
    
    private func sparHanleRefresh() {
        API.getSparPartsData{ (error: Error?, sparParts: [SparParts]?) in
            
            if let sparParts = sparParts {
                self.sparParts = sparParts
                self.sparepartsCollection.reloadData()
                print("last \(sparParts)")
            }
            
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sparParts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = sparepartsCollection.dequeueReusableCell(withReuseIdentifier: "spaerPartsCell", for: indexPath) as? sparPartsCell {
            let spar = sparParts[indexPath.row]
            cell.configuerCell(sparpart: spar)
            return cell
        }else {
            return sparPartsCell()
        
        }
    }
}
