//
//  NumberTableViewCell.swift
//  Quiz 2
//
//  Created by Mauricio Rojas Vindas on 18/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit

class NumberTableViewCell: UITableViewCell {

    @IBOutlet weak var numLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
