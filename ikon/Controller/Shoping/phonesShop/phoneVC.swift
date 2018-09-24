//
//  phoneVC.swift
//  ikon
//
//  Created by FARIDO on 9/16/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit
import Alamofire

class phoneVC: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource {

    @IBOutlet weak var phoneShop: UICollectionView!
    
    var phones = [Phone]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneShop.delegate = self
        phoneShop.dataSource = self
        phonesHanleRefresh()
        print("fff\(phones)")
        
    }
    
    private func phonesHanleRefresh() {
        API.getPhoneData{ (error: Error?, phones: [Phone]?) in
            
            if let phones = phones {
                self.phones = phones
                self.phoneShop.reloadData()
                print("phoneslast \(phones)")
            }
            
        }
    }
    
    
    
    
    
    //collectionView Func..............................................phoneCell
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return phones.count	
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = phoneShop.dequeueReusableCell(withReuseIdentifier: "phoneCell", for: indexPath) as? phonesCell {
            let phone = phones[indexPath.row]
            cell.configuerCell(phone: phone)
            //print("ssdd \(cell)")
            return cell
        } else {
            return phonesCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "phoneDetails", sender: phones[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distantion = segue.destination as? phonesDetials{
            if let phone = sender as? Phone {
                distantion.singelItem = phone
            }
        }
    }
    
    
    //collectionView Func..............................................phoneCell/phoneDetails
    
}
