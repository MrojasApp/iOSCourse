//
//  EnterNumberViewController.swift
//  Quiz#3
//
//  Created by Mauricio Rojas Vindas on 23/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit

class EnterNumberViewController: UIViewController {

    var dataCell = [DataCell]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dataTextFiled: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerCustomCell(identifier: NumberCustomCell.getCellIndentifier())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButton(_ sender: UIButton)
    {
        if let data = dataTextFiled.text{
            let _dat = DataCell(valor: data)
            dataCell.append(_dat)
            tableView.reloadData()
            dataTextFiled.text = ""
        }
    }

}

extension EnterNumberViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCell.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NumberCustomCell.getCellIndentifier()) as! NumberCustomCell
        
        let _dataCell = dataCell[indexPath.row]
        cell.dataLabel.text = _dataCell.valor
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}
