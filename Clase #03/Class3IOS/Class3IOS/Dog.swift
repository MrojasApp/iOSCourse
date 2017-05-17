//
//  Dog.swift
//  Class3IOS
//
//  Created by Mauricio Rojas Vindas on 16/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit

class Dog: NSObject {
    var name: String
    var age: String
    var color: String
    
    init(name: String, age: String, color:String){
        self.name = name
        self.age = age
        self.color = color
    }
}
