//
//  guestVC.swift
//  ikon
//
//  Created by FARIDO on 9/2/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit

class guestVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionviewGuest: UICollectionView!
    var sliderArray = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        


        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliderArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! GuestCollectionViewCell
        cell.gustSlider.image = sliderArray[indexPath.row]
        return cell
    }
    
    
    //IBActions/////////////////////////////////
    @IBAction func sidemenuBTN(_ sender: Any) {
        if let vc = self.revealViewController(){
            vc.revealToggle(animated: true)
            
            self.view.addGestureRecognizer(vc.panGestureRecognizer())
            self.view.addGestureRecognizer(vc.tapGestureRecognizer())
        }
    }
    
}
