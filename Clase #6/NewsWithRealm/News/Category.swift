//
//  Category.swift
//  News
//
//  Created by Cesar Brenes on 5/18/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.
//

import UIKit
import RealmSwift

//enum CategoryType{
//    case economy,sports, incidents, technology
//}

class Category: Object {
    
    dynamic var name = ""
    dynamic var imageName = ""
    dynamic var type = 0
    let news = List<News>()
    
//    dynamic var newsArray: [News]
//    dynamic var type: CategoryType
    
//    init(name: String, image: String, type: CategoryType) {
//        self.name = name
//        self.image = UIImage(named: image)!
//        self.type = type
//        newsArray = [News]()
//    }

}
