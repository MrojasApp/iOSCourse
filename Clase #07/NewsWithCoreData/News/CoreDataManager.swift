//
//  CoreDataManager.swift
//  News
//
//  Created by Mauricio Rojas Vindas on 30/5/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.
//

import UIKit
//import MagicalRecord
import CoreData

class CoreDataManager: NSObject {
    class func getAllCategories() -> [Category]
    {
        let result = Category.mr_findAll()
        
        if result!.count == 0 {
            return createDefaultsCategory()
        }

        return result as! [Category]
    }
    
    class func createDefaultsCategory() -> [Category]{
        createCategory(name: "Economia", imageName: "economy")
        createCategory(name: "Deportes", imageName: "sports")
        createCategory(name: "Tecnología", imageName: "technology")
        createCategory(name: "Sucesos", imageName: "incident")
        saveContext()
        return getAllCategories()
    }
    
    class func addNews(category: Category, title: String, description: String)
    {
        let news = News.mr_createEntity()
        news?.title = title
        news?.descriptionNews = description
        news?.createdAt = Date()
        
        //news?.category = category
        category.addNewsObject(news!)
        saveContext()
    }
    
    private class func createCategory(name: String, imageName: String)
    {
        let category = Category.mr_createEntity()
        category?.name = name
        category?.imageName = imageName
    }
    
    private class func saveContext(){
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
    }
}
