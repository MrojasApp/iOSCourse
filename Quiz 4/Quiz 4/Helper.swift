//
//  Helper.swift
//  Quiz 4
//
//  Created by Mauricio Rojas Vindas on 30/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    class func getViewControllerIdentifier() -> String{
        return String(describing: self)
    }
}

extension UITableViewCell{
    class func getTableViewCellIdentifier() -> String{
        return String(describing: self)
    }
}

extension UITableView{
    func registerCustomCell(identifier: String){
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
}
