//
//  shopingInfo.swift
//  ikon
//
//  Created by FARIDO on 9/27/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit

class shopingInfo: UIViewController, UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tabelview: UITableView!
    
    var infos = [getShopInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelview.delegate = self
        tabelview.dataSource = self
        phonesHanleRefresh()
    }
    
    private func phonesHanleRefresh() {
        API.getshopsInfo{ (error: Error?, infoes: [getShopInfo]?) in
            
            if let info = infoes {
                self.infos = info
                self.tabelview.reloadData()
                print("phoneslast \(info)")
            }
            
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tabelview.dequeueReusableCell(withIdentifier: "shopcell", for: indexPath) as? shopInfCell {
            let info = infos[indexPath.row]
            cell.configerCell(shop: info)
            return cell
        }else {
            return shopInfCell()
        }
    }
    
    
    @IBAction func back(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "gustMain")
        let nav = UINavigationController(rootViewController: vc)
        if let vcs = self.revealViewController() {
            vcs.pushFrontViewController(nav, animated: true)
            
        }
    }
}
