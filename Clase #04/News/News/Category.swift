//
//  Category.swift
//  News
//
//  Created by Mauricio Rojas Vindas on 18/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit

class Category: NSObject {
    
    var name: String
    var image: UIImage
    var newsArray: [News]
    
    init(name: String, image: String) {
        self.name = name
        self.image = UIImage(named: image)!
        self.newsArray = [News]()
    }
}
