//
//  DogViewController.swift
//  Class3IOS
//
//  Created by Mauricio Rojas Vindas on 16/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit

class DogViewController: UIViewController {

    var dogs = [Dog]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeDogArray()
        tableView.registerCustomCell(identifier: DogTableViewCell.getCellIndentifier())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeDogArray(){
        let dog1 = Dog(name:"Dog1", age:"1", color:"rojo")
        let dog2 = Dog(name:"Dog2", age:"2", color:"verde")
        let dog3 = Dog(name:"Dog3", age:"3", color:"azul")
        let dog4 = Dog(name:"Dog4", age:"4", color:"blanco")
        let dog5 = Dog(name:"Dog5", age:"5", color:"negro")
        
        dogs = [dog1,dog2,dog3,dog4,dog5]
    }
}

extension DogViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DogTableViewCell.getCellIndentifier()) as! DogTableViewCell
        
        let _dog = dogs[indexPath.row]
        cell.nameLabel.text = _dog.name
        cell.colorLabel.text = _dog.color
        cell.ageLabel.text = _dog.age
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
