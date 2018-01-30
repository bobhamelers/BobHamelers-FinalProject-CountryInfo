//
//  ListTableViewCell.swift
//  CountryInfo
//
//  Cell outlet definition, used in ListTableViewController, ListFeederTableViewController and ListChangerTableViewController.
//
//  Created by Bob Hamelers on 22/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
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
