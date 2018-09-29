//
//  maintanceInfo.swift
//  ikon
//
//  Created by FARIDO on 9/27/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit

class maintanceInfo: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tabelView: UITableView!
    
    var infos = [getMaintInf]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.delegate = self
        tabelView.dataSource = self
        
        phonesHanleRefresh()
        print(infos)
    }
    
    private func phonesHanleRefresh() {
        API.getMaintInfo{ (error: Error?, infoes: [getMaintInf]?) in
            
            if let info = infoes {
                self.infos = info
                self.tabelView.reloadData()
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
        if let cell = tabelView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as? maintIfoCEll {
            let info = infos[indexPath.row]
            cell.configerCell(maint: info)
            return cell
        }else {	
            return maintIfoCEll()
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
