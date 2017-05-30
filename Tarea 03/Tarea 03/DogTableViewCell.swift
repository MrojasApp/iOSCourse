//
//  DogTableViewCell.swift
//  Tarea 03
//
//  Created by Mauricio Rojas Vindas on 27/5/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit

class DogTableViewCell: UITableViewCell {
    
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameImagen: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(dog: Dog)
    {
        nameLabel.text = dog.name
        colorLabel.text = dog.color
        nameImagen.image = UIImage(named: dog.imageName)
    }
    
}
