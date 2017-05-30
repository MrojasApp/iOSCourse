//
//  CatListViewController.swift
//  Quiz 4
//
//  Created by Mauricio Rojas Vindas on 30/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit
import RealmSwift

class CatListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var cats: Results<Cat>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //initializeCat()
        createAddButton()
        tableView.registerCustomCell(identifier: CatCustomTableViewCell.getTableViewCellIdentifier())
        self.title = "Cats"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        cats = RealmManager.getAllCat()
        tableView.reloadData()
    }
    
//    func initializeCat(){
//        cats = RealmManager.getAllCat()
//    }
    
    func createAddButton(){
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func addAction(){
        let viewController = storyboard!.instantiateViewController(withIdentifier: AddCatViewController.getViewControllerIdentifier()) as! AddCatViewController
        
        navigationController?.pushViewController(viewController, animated: true)
    }

}

extension CatListViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cats = cats else {
            return 0
        }
        return cats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CatCustomTableViewCell.getTableViewCellIdentifier()) as! CatCustomTableViewCell
        
        cell.setupCell(cat: cats![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
