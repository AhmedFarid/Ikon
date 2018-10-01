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
            vc.rearViewRevealWidth = 280
        }
    }
    
    @IBAction func langBTN(_ sender: Any) {
        
        if Language.currentLanguage() == "ar" {
            Language.setAppLanguage(lang: "en-US")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }else{
            Language.setAppLanguage(lang: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
        
        
        let window = (UIApplication.shared.delegate as? AppDelegate)?.window
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let api_token = helper.getApiToken(){
            print(api_token)
//            let tab = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "swrer")
//            window?.rootViewController = tab
            window?.rootViewController = sb.instantiateViewController(withIdentifier: "swrer")
            UIView.transition(with: window!, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
        }else{
        window?.rootViewController = sb.instantiateViewController(withIdentifier: "nave")
        UIView.transition(with: window!, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        
        
    }
}
