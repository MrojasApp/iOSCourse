//
//  DogTableViewController.swift
//  CustomTableView
//
//  Created by Mauricio Rojas Vindas on 16/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit

class DogTableViewController: UITableViewController {

    let keyName = "KeyName"
    let keyColor = "KeyColor"
    let KeyAge = "KeyAge"
    
    var dataSource : [[String:Any]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeDataSourceWithDictionary()
        registerCustomCell()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func registerCustomCell(){
        let nib = UINib(nibName: "DogTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DogTableViewCell")
    }
    
    func initializeDataSourceWithDictionary()
    {
        let dog1 = [keyName:"Bruno", keyColor:"Negro", KeyAge:"2 años"]
        let dog2 = [keyName:"Jose", keyColor:"Blanca", KeyAge:"3 años"]
        let dog3 = [keyName:"Pipo", keyColor:"Amarillo", KeyAge:"4 años"]
        let dog4 = [keyName:"Ana", keyColor:"Verde", KeyAge:"5 años"]
        let dog5 = [keyName:"Diego", keyColor:"Azul", KeyAge:"6 años"]
        
        dataSource = [dog1,dog2,dog3,dog4,dog5]
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = dataSource?.count else {
            return 0
        }
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DogTableViewCell", for: indexPath) as! DogTableViewCell

        //let name = dataSource![indexPath.row][keyName]
        //cell.textLabel?.text = (name as! String)
        
        let dictionary = dataSource![indexPath.row]
        cell.nameLabel.text = (dictionary[keyName] as! String)
        cell.colorLabel.text = (dictionary[keyColor] as! String)
        cell.ageLabel.text = (dictionary[KeyAge] as! String)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
