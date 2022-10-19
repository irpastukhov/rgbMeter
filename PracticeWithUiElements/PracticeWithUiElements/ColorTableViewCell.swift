//
//  ColorTableViewCell.swift
//  PracticeWithUiElements
//
//  Created by Ivan Pastukhov on 14.10.2022.
//

import UIKit

class ColorTableViewCell: UITableViewCell {
    

    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var colorInfoButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        colorLabel.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
