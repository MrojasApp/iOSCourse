//
//  CategoriesViewController.swift
//  News
//
//  Created by Mauricio Rojas Vindas on 18/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {

    var categories = [Category]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCategories()
        tableView.registerCustomCell(identifier: categoryTableViewCell.getTableViewCellIdentifier())
        self.title = "Categorias"
    }
    
    func initializeCategories(){
        let economyCategory = Category(name: "Economía", image: "economy")
        let sportCategory = Category(name: "Sports", image: "sports")
        let techologyCategory = Category(name: "Tecnología", image: "technology")
        let incidentCategory = Category(name: "Sucesos", image: "incident")
        
        categories = [economyCategory,sportCategory,techologyCategory,incidentCategory]
    }
}

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: categoryTableViewCell.getTableViewCellIdentifier())) as! categoryTableViewCell
        
        cell.setupCell(category: categories[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let newsViewController = storyboard?.instantiateViewController(withIdentifier: NewsViewController.getViewControllerIdentifier()) as! NewsViewController
        newsViewController.news = categories[indexPath.row].newsArray
        navigationController?.pushViewController(newsViewController, animated: true)
    }
}
