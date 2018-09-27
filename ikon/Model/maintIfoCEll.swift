//
//  maintIfoCEll.swift
//  ikon
//
//  Created by FARIDO on 9/27/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit

class maintIfoCEll: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typelabel: UILabel!
    @IBOutlet weak var spare: UILabel! // spare
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var isssue: UILabel!
    @IBOutlet weak var dateLab: UILabel!
    @IBOutlet weak var pricelab: UILabel!
    @IBOutlet weak var notelabel: UILabel!
    
    func configerCell(maint: getMaintInf) {
        nameLabel.text = maint.customersFirstname + maint.customersLastname
        typelabel.text = maint.type
        spare.text = maint.sparePart
        color.text = maint.color
        isssue.text = maint.issue
        dateLab.text = maint.orderDate
        pricelab.text = maint.price
        notelabel.text = maint.note
        
    }
    
}
