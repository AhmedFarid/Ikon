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
    
    var phone: phones!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneShop.delegate = self
        phoneShop.dataSource = self
        
        phone = phones()
    }
    
    func downloadPhoneData(completed: DownloadComplete){
        let url = URLs.getPhonesData
        let apiToken = "11"
        let lang = "ar"
        
        let parameters = [
            "api_token": apiToken,
            "lang": lang
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                
        }
    }
    
    //collectionView Func..............................................phoneCell
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = phoneShop.dequeueReusableCell(withReuseIdentifier: "phoneCell", for: indexPath)
        return cell
    }
    
    
    //collectionView Func..............................................phoneCell
    
}
