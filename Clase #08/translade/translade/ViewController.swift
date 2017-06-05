//
//  ViewController.swift
//  translade
//
//  Created by Mauricio Rojas Vindas on 30/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController, NVActivityIndicatorViewable {

    @IBOutlet weak var origenTextView: UITextView!
    @IBOutlet weak var destinationTextView: UITextView!

    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    
    var languagesArray : [[String: String]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicator()
        
        registerNotifications()
        
        APIManager.getLanguages()
    }

    func registerNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector (getLanguagesAvailable(notification:)), name: Notification.Name( Constants.GET_LENGUAGES_NOTIFICATION), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector (errorFound), name: Notification.Name( Constants.ERROR_FOUND_NOTIFICATION), object: nil)
    }
    
    
    func getLanguagesAvailable(notification: Notification){
        languagesArray = notification.userInfo![Constants.LENGUAGE_KEY] as? [[String: String]]
        //print("EL TAMAÑO  DEL ARRAY ES DE \(languagesArray.count)")
        hideActivityIndicador()
    }
    
    func errorFound()
    {
        hideActivityIndicador()
        let alertController = UIAlertController(title: "Error found", message: "We found an error trying to download the languages, please try later", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion:  nil)
    }
    
    func showActivityIndicator(){
        DispatchQueue.main.async {
            let size = CGSize(width: 35, height: 35)
            self.startAnimating(size,message: nil, type: NVActivityIndicatorType.orbit)
        }
    }
    func hideActivityIndicador(){
        DispatchQueue.main.async {
            self.stopAnimating()
        }
    }

    @IBAction func origenLanguageAction(_ sender: Any) {
    }
    @IBAction func destinationLanguageAction(_ sender: Any) {
    }
    @IBAction func changeLanguageAction(_ sender: Any) {
    }

}

