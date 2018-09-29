//
//  Localizer.swift
//  ikon
//
//  Created by FARIDO on 9/28/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import Foundation


class Localizer {
    class func DoTheExchange() {
        ExchangeMethodsForClass(className: Bundle.self, originalSelector: #selector(Bundle.localizedString(forKey:value:table:)), overrideSelector: #selector(Bundle.customLocalizedStringForKey(key:value:table:)))
    }
    
}

extension Bundle {
    
    @objc func customLocalizedStringForKey(key: String, value: String?, table tableName: String) -> String {
        let currentLanguage = Language.currentLanguage()
        var bundle = Bundle()
        if let path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj") {
            bundle = Bundle(path: path)!
        }else {
            let path = Bundle.main.path(forResource: "Base", ofType: "lproj")
            bundle = Bundle(path: path!)!
        }
        return bundle.customLocalizedStringForKey(key: key,value:value,table:tableName)
    }
    
}

func ExchangeMethodsForClass(className: AnyClass, originalSelector: Selector, overrideSelector: Selector){
    let originalMethod: Method = class_getInstanceMethod(className, originalSelector)!
    let overrideMethod: Method = class_getInstanceMethod(className, overrideSelector)!
    
    if class_addMethod(className, originalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod)) {
        class_replaceMethod(className, overrideSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
    }else {
        method_exchangeImplementations(originalMethod, overrideMethod)
    }
}
