//
//  Helper.swift
//  Tarea 2
//
//  Created by Mauricio Rojas Vindas on 20/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import Foundation
import UIKit

extension UITableView{
    func registerCustomCell(identifier: String)
    {
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
}
extension UITableViewCell{
    class func getCellIndentifier() -> String{
        return String(describing: self)
    }
}
