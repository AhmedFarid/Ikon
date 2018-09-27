//
//  shopingLocationVC.swift
//  ikon
//
//  Created by FARIDO on 9/23/18.
//  Copyright © 2018 FARIDO. All rights reserved.

//    func configuerCell (cart: Cart) {
//        prodactName.text = cart.productName
//        prodactPrice.text = cart.productPrice
//        brodactDes.text = cart.productDes
//
//        prodactImage.kf.indicatorType = .activity
//        if let url = URL(string: "http://ikongo.com/site/\(cart.productImage ?? "")"){
//            //print(url)
//            prodactImage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
//        }
//    }


//

import UIKit
import MapKit
import CoreData
import CoreLocation


class shopingLocationVC: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var phoneTXT: UITextField!
    @IBOutlet weak var adderssTXT: UITextField!
    @IBOutlet weak var mapLocation: MKMapView!
    

    var lat = "111"
    var long = "111"
    var totalPrice = 0
    var products = ""
    
    var locagtionManger = CLLocationManager()
    var locationManageer: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceLabel.text = "Shop Price: \(totalPrice)"
        
        mapLocation.showsUserLocation = true
        mapLocation.delegate = self
        
        locationManageer = CLLocationManager()
        locationManageer?.requestWhenInUseAuthorization()
    }

    
    

    @IBAction func getLocationBTN(_ sender: Any) {
        let userLocation = mapLocation.userLocation
        let region = MKCoordinateRegionMakeWithDistance((userLocation.location?.coordinate)! ,1000,1000)
        mapLocation.setRegion(region, animated: true)
        let longitude :CLLocationDegrees = (self.locagtionManger.location?.coordinate.longitude)!
        print("long\(longitude)")
        self.long = "\(longitude)"
        let latitude :CLLocationDegrees = (self.locagtionManger.location?.coordinate.latitude)!
        print("lat\(latitude)")
        self.lat = "\(latitude)"
        
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            
            if error != nil {
                print("error")
                return
            }
            
            if (placemarks?.count)! > 0 {
                let pm = placemarks?[0] as CLPlacemark?
                var address: String!
                address = (pm?.thoroughfare)! + " " + (pm?.locality)! + " " + (pm?.country)!
                print("addersssss \(address)")
                self.adderssTXT.text = address
            }else {
                print("error2")
            }
        })
        
    }
    
    @IBAction func orderShopBTN(_ sender: Any) {
        
        guard let phone = phoneTXT.text, !phone.isEmpty else {
            self.showAlert(title: "Order Filed", message: "enter your phone")
            return
        }
        
        guard let addreess = adderssTXT.text, !addreess.isEmpty else {
            self.showAlert(title: "Order Filed", message: "enter your address or click in get location")
            return
        }
        
        API_Orders.shopOrder(address: adderssTXT.text!, latitude: lat, longitude: long, phone: phone, total_price: "\(totalPrice)", products: products) { (error: Error?, success: Bool) in
            if success {
                self.showAlert(title: "Order Success", message: "Your order is successfull go to main page")
                let delegate = UIApplication.shared.delegate as! AppDelegate
                let context = delegate.persistentContainer.viewContext
                
                let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Cart")
                let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
                
                do {
                    try context.execute(deleteRequest)
                    try context.save()
                } catch {
                    print ("There was an error")
                }
                
                
            }else{
                self.showAlert(title: "Order Filed", message: "please login frist")
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        mapLocation.centerCoordinate = userLocation.location!.coordinate
    }
}
