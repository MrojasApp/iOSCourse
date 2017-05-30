//
//  AddCatViewController.swift
//  Quiz 4
//
//  Created by Mauricio Rojas Vindas on 30/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit

class AddCatViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addSaveCat()
    }

    func addSaveCat(){
        let saveAction = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveCatAction))
        navigationItem.rightBarButtonItem = saveAction
    }
    
    func saveCatAction(){
        
        let _name: String = nameLabel.text!
        
        if _name.isEmpty {
            DisplayError(message: "name es vacio")
        }
        else{
            if RealmManager.getCatName(name: _name) > 0
            {
                DisplayError(message: "name ya existe")
            } else {
                RealmManager.createCat(name: nameLabel.text!)
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
    private func DisplayError(message: String)
    {
        let alertController = UIAlertController(title: "Error", message: "\(message)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
        
    }
    

}
