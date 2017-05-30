//
//  RealmManager.swift
//  Tarea 03
//
//  Created by Mauricio Rojas Vindas on 28/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit
import RealmSwift

class RealmManager: NSObject {
    
    class func getAllDog() -> Results<Dog>?{
        let realm = try! Realm()

        let dogs = realm.objects(Dog.self)
        if dogs.count > 0 {
            return dogs.sorted(byKeyPath: "orden", ascending: false)
        }
        return nil
    }
    
    class func createDog(name: String, imageName: String, color: String)
    {
        let dog = Dog()
        dog.name = name
        dog.imageName = imageName
        dog.color = color
        dog.orden = getIndexDog()

        addObjectToRealm(realmObject: dog)
    }
    
    private class func addObjectToRealm(realmObject: Object)
    {
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmObject)
        }
    }
    
    private class func getIndexDog() -> Int{
        let realm = try! Realm()
        
        let dogs = realm.objects(Dog.self)
        if dogs.count > 0 {
            return dogs.count + 1
        }
        return 1
    }
}
