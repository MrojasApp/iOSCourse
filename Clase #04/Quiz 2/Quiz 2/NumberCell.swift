//
//  NumberCell.swift
//  Quiz 2
//
//  Created by Mauricio Rojas Vindas on 18/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit

class NumberCell: NSObject {
    
    var number: String
    var type: String
    
    init(number: String, type: String){
        self.number = number
        self.type = type
    }

}
