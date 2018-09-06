//
//  maintanceVC.swift
//  ikon
//
//  Created by FARIDO on 9/2/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit

class maintanceVC: UIViewController {

    
    //outLets.......................................
    @IBOutlet weak var selectServiceTF: UITextField!
    @IBOutlet weak var selectModelTF: UITextField!
    @IBOutlet weak var selectColorTF: UITextField!
    @IBOutlet weak var issueTF: UITextField!
    @IBOutlet weak var otherIssueTF: UITextField!
    //outLets.......................................
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //Actions.......................................
    @IBAction func getPrice(_ sender: Any) {
        //////////////////////////////////////////////////////////////////////////////////////
        guard let selectService = selectServiceTF.text, !selectService.isEmpty else { return }
        guard let selectModel = selectModelTF.text, !selectModel.isEmpty else { return }
        guard let selectColor = selectColorTF.text, !selectColor.isEmpty else { return }
        guard let issue = issueTF.text, !issue.isEmpty else { return }
        guard let otherIssue = otherIssueTF.text, !otherIssue.isEmpty else { return }
        performSegue(withIdentifier: "maintanceSuge", sender: nil)
        //////////////////////////////////////////////////////////////////////////////////////
        
    }
    
    //Actions.......................................

}
