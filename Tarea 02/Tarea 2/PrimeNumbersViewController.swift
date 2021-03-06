//
//  PrimeNumbersViewController.swift
//  Tarea 2
//
//  Created by Mauricio Rojas Vindas on 20/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit

class PrimeNumbersViewController: UIViewController {
    var _flat = 0
    var primeNumbers = [PrimeNumber]()
    @IBOutlet weak var numbersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        IniciatizePrimeNumbers()
        numbersTableView.registerCustomCell(identifier: numbersTableViewCell.getCellIndentifier())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func IniciatizePrimeNumbers(){
        for index in 1...1000
        {
            if index == 1
            {
                appendData(_value:String(index))
            }
            else{
                var _p: Int = 0
                for j in 1...index
                {
                    if index%j == 0
                    {
                        _p += 1
                    }
                }
            
                if _p==2{
                    appendData(_value:String(index))
                }
            }
        }
    }
    
    func appendData(_value: String)
    {
        let _label = _value
        var _color: UIColor
        if _flat == 0
        {
            _color = UIColor.gray
            _flat = 1
        }else{
            _color = UIColor.white
            _flat = 0
        }
        
        let _dato = PrimeNumber(number: _label, color: _color)
        primeNumbers.append(_dato)

    }
}

extension PrimeNumbersViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return primeNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: numbersTableViewCell.getCellIndentifier()) as! numbersTableViewCell
        
        let _primeNumber = primeNumbers[indexPath.row]
        cell.numberLabel.text = _primeNumber.number
        cell.backgroundColor = _primeNumber.color
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
