//
//  ListsTableViewCell.swift
//  CountryInfo
//
//  Cell outlet definition, used in ListsTableViewController.
//
//  Created by Bob Hamelers on 21/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import UIKit

class ListsTableViewCell: UITableViewCell {
    
    // MARK: Outlets.
    @IBOutlet weak var titleLabel: UILabel!
    
    /// MARK: AwakeFromNib.
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    /// MARK: Set Selected.
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
