//
//  NumbersViewController.swift
//  Quiz 2
//
//  Created by Mauricio Rojas Vindas on 18/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit

class NumbersViewController: UIViewController {

    var numbers = [NumberCell]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeNumberArray()
        tableView.registerCustomCell(identifier: NumberTableViewCell.getCellIndentifier())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeNumberArray(){
        for index in 1...100
        {
            let valor:String = String(index)
            var typoPar: String = "I"
            if index%2 == 0
            {
              typoPar = "P"
            }
            
            let numb = NumberCell(number: valor, type: typoPar)
            numbers.append(numb)
        }
    }


}

extension NumbersViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NumberTableViewCell.getCellIndentifier()) as! NumberTableViewCell
        
        let _numb = numbers[indexPath.row]
        cell.numLabel.text = _numb.number as String
        
        //if _numb.type == "P"
        //cell.tableView.backgrund
        cell.backgroundColor = #111111
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}
