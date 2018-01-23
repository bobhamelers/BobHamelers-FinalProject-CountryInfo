//
//  ListTableViewCell.swift
//  CountryInfo
//
//  Created by Bob Hamelers on 22/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
