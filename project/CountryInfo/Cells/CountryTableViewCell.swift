//
//  CountryTableViewCell.swift
//  CountryInfo
//
//  Cell outlets definitions, used in CountryTableViewController.
//
//  Created by Bob Hamelers on 19/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    //MARK: Outlets.
    @IBOutlet weak var labelCountryName: UILabel?
    
    @IBOutlet weak var labelAlphaTwo: UILabel?
    @IBOutlet weak var labelAlphaThree: UILabel?
    @IBOutlet weak var labelNumericCode: UILabel?
    @IBOutlet weak var labelInternetCodes: UILabel?
    
    @IBOutlet weak var labelCallingCodes: UILabel?
    @IBOutlet weak var labelTimezones: UILabel?
    
    @IBOutlet weak var labelCapital: UILabel?
    @IBOutlet weak var labelRegion: UILabel?
    @IBOutlet weak var labelSubregion: UILabel?
    @IBOutlet weak var labelBorders: UILabel?
    @IBOutlet weak var labelPopulation: UILabel?
    @IBOutlet weak var labelDemonym: UILabel?
    
    
    @IBOutlet weak var labelRegionalBlocs: UILabel?
    @IBOutlet weak var labelCurrencies: UILabel?
    @IBOutlet weak var labelLanguages: UILabel?
    
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
