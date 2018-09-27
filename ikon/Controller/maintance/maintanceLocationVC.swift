//
//  maintanceLocationVC.swift
//  ikon
//
//  Created by FARIDO on 9/3/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//
import UIKit
import MapKit
import CoreLocation


class maintanceLocationVC: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var phoneTXT: UITextField!
    @IBOutlet weak var adderssTXT: UITextField!
    @IBOutlet weak var mapLocation: MKMapView!
    
    
    var priceValue = 0
    var apiToken = "11"
    var sparePart = ""
    var type = ""
    var color = ""
    var note = "xxx"
    var issue = ""
    var lat = "111"
    var long = "111"
    var productId = ""
    
    var lats = 0.0
    var longs = 0.0
    
    
    
    var locagtionManger = CLLocationManager()
    var locationManageer: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(sparePart)
        print(type)
        print(color)
        print(note)
        print(issue)
        priceLabel.text = "Price: \(priceValue)"
        mapLocation.showsUserLocation = true
        mapLocation.delegate = self
        
        locationManageer = CLLocationManager()
        locationManageer?.requestWhenInUseAuthorization()
    
        let longitude :CLLocationDegrees = (self.locagtionManger.location?.coordinate.longitude)!
        print("long\(longitude)")
        self.longs = longitude
        self.long = "\(longitude)"
        let latitude :CLLocationDegrees = (self.locagtionManger.location?.coordinate.latitude)!
        print("lat\(latitude)")
        self.lat = "\(latitude)"
        self.lats = latitude
    }
    
    @IBAction func getLocationBTN(_ sender: Any) {
        let longitude :CLLocationDegrees = (self.locagtionManger.location?.coordinate.longitude)!
        self.long = "\(longitude)"
        let latitude :CLLocationDegrees = (self.locagtionManger.location?.coordinate.latitude)!
        self.lat = "\(latitude)"
        let userLocation = mapLocation.userLocation
        let region = MKCoordinateRegionMakeWithDistance((userLocation.location?.coordinate)! ,1000,1000)
        mapLocation.setRegion(region, animated: true)
        
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            
            if error != nil {
                print("error")
                return
            }
            
            if (placemarks?.count)! > 0 {
                let pm = placemarks?[0] as CLPlacemark?
                let address = (pm?.thoroughfare)! + " " + (pm?.locality)! + " " + (pm?.country)!
                print("addersssss \(address)")
                self.adderssTXT.text = address
            }else {
                print("error2")
            }
        })
        
    }
    
    @IBAction func orderMaintBTN(_ sender: Any) {
        guard let phone = phoneTXT.text, !phone.isEmpty else {
            self.showAlert(title: "Order Filed", message: "enter your phone")
            return
        }
        
        guard let addreess = adderssTXT.text, !addreess.isEmpty else {
            self.showAlert(title: "Order Filed", message: "enter your address or click in get location")
            return
        }
        API_Orders.maintenanceOrder(apiToken: apiToken, sparePart: sparePart, type: type, color: color, note: note, address: addreess, latitude: lat, longitude: long, price: "\(priceValue)", issue: issue, phone: phone, product_id: productId) { (error: Error?, success: Bool) in
            if success {
                self.showAlert(title: "Order Success", message: "Your order is successfull go to main page")
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let abcViewController = storyboard.instantiateViewController(withIdentifier: "gustMain") as! guestVC
//                abcViewController.title = "ABC"
//                self.navigationController?.pushViewController(abcViewController, animated: true)
            }else{
                self.showAlert(title: "Order Filed", message: "please login frist")
            }
            }
        }
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        mapLocation.centerCoordinate = userLocation.location!.coordinate
    }
}
