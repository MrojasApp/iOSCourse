//
//  DogViewController.swift
//  Tarea 03
//
//  Created by Mauricio Rojas Vindas on 27/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit
import RealmSwift

class DogViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dogs: Results<Dog>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAddButton()
        tableView.registerCustomCell(identifier: DogTableViewCell.getTableViewCellIdentifier())
        self.title = "Dogs"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        dogs = RealmManager.getAllDog()
        tableView.reloadData()
    }

    func createAddButton(){
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = addButton
    }
    func addAction(){
        let viewController = storyboard!.instantiateViewController(withIdentifier: AddDogViewController.getViewControllerIdentifier()) as! AddDogViewController
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension DogViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let _dog = dogs else {
            return 0
        }
        return _dog.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DogTableViewCell.getTableViewCellIdentifier()) as! DogTableViewCell
        cell.setupCell(dog: dogs![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}
