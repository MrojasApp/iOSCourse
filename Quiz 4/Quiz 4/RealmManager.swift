//
//  RealmManager.swift
//  Quiz 4
//
//  Created by Mauricio Rojas Vindas on 30/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit
import RealmSwift

class RealmManager: NSObject {
    
    class func getAllCat() -> Results<Cat>?
    {
        let realm = try! Realm()
        let cat = realm.objects(Cat.self)
        if cat.count > 0 {
            return cat
        }
        return nil
    }
    
    class func createCat(name: String)
    {
        let cat = Cat()
        cat.name = name
        
        addObjectToRealm(realmObject: cat)
    }
    
    class func getCatName(name: String) -> Int
    {
        let cat = Cat()
        cat.name = name
        
//        let realm = try! Realm()
//        let cats = realm.objects(Cat.self)
//        
//        if cats.count > 0 {
//            let _dd =  cats.first(where: cat)
//            return _dd.count
//        }
    
        return 0
    }
    
    private class func addObjectToRealm(realmObject: Object)
    {
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmObject)
        }
    }
}
