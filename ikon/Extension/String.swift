//
//  String.swift
//  ikon
//
//  Created by FARIDO on 9/4/18.
//  Copyright © 2018 FARIDO. All rights reserved.
//

import Foundation



extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
