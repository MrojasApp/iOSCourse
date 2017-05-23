//
//  News.swift
//  News
//
//  Created by Mauricio Rojas Vindas on 18/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit

class News: NSObject {
    var titleNews: String
    var descriptionNews: String
    var createdAt : Date
    
    init(titleNews:String, descriptionNews: String, createdAt: Date ) {
        self.titleNews = titleNews
        self.descriptionNews = descriptionNews
        self.createdAt = createdAt
    }
}
