//
//  DogTableViewCell.swift
//  Tarea_04
//
//  Created by Mauricio Rojas Vindas on 4/6/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit

class DogTableViewCell: UITableViewCell {

    @IBOutlet weak var imageNameView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    
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
       
        let image : UIImage = UIImage(data: dog.imageName as! Data)!
        imageNameView.image = image
    }
    
}
