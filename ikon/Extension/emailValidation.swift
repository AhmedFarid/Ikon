//
//  emailValidation.swift
//  ikon
//
//  Created by FARIDO on 9/4/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import UIKit

class emailValidation: NSObject {
    
   class func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }

}
