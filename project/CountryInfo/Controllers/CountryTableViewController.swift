//
//  CountryTableViewController.swift
//  CountryInfo
//
//  This Controller displays specific information of a country.
//  On top, it displays the country flag.
//  Below that it displays standard information, divided in sections, rows and cells.
//  In the right upper front, an user can click to open a map of a country in maps.
//
//  Created by Bob Hamelers on 17/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import UIKit

class CountryTableViewController: UITableViewController {

    // MARK: Properties.
    let countryInfoController = CountryInfoController()
    let sectionTitles = ["Name country", "Basic codes of country", "Calling Codes and Timezones", "Basic geographical information", "Regional Partnerships", "Currencies", "Languages"]
    var informations = [Information]()
    var countryInfo = [Information]()
    
    // MARK: Actions.
    /// Function that opens a URL with a SVG image of a flag.
    @IBAction func didTapFlag(_ sender: Any) {
        UIApplication.shared.open(NSURL(string: countryInfo[0].flag!)! as URL)
    }
    
    /// Fuction that connects to a country map in maps.
    @IBAction func didTapOpenInMaps(_ sender: Any) {
        
        
        let myLink = countryInfo[0].name!.folding(options: .diacriticInsensitive, locale: .current)
        let link = myLink.replacingOccurrences(of: " ", with: "%20")
        UIApplication.shared.open(NSURL(string: "https://maps.apple.com/?address=\(link)")! as URL, options: [:])
        // Go to the specific country URL in maps.
    }
    
    /// ViewDidLoad standard.
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    /// Function that displays amount of sections.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }

    /// Function that displays rows per section.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return 1
        case 1:
            return 4
        case 2:
            return 2
        case 3:
            return 6
        case 4:
            return countryInfo[0].regionalBlocs!.count
        case 5:
            return countryInfo[0].currencies!.count
        case 6:
            return countryInfo[0].languages!.count
        default:
            return 0
        }
    }
    
    /// Function that displays headers per section from sectionTitles array.
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section >= 0 && section <= 6 {
            return sectionTitles[section]
        }
        return nil
    }
    
    fileprivate func numericCode(_ cell: CountryTableViewCell) {
        var text = ""
        if let numericCode = countryInfo[0].numericCode {
            text += numericCode
        }
        cell.labelNumericCode!.text = ("Numeric Code:  ") + text
    }
    
    fileprivate func regionalBlocs(_ indexPath: IndexPath, _ cell: CountryTableViewCell) {
        let text = countryInfo[0].regionalBlocs![indexPath.row].acronym! + ", " + countryInfo[0].regionalBlocs![indexPath.row].name!
        cell.labelRegionalBlocs!.text = ("Regional Bloc:  ") + text
    }
    
    fileprivate func currency(_ indexPath: IndexPath, _ cell: CountryTableViewCell) {
        var text = ""
        if let name = countryInfo[0].currencies![indexPath.row].name {
            text += name + ", "
        }
        if let code = countryInfo[0].currencies![indexPath.row].code {
            text += code + ", "
        }
        if let symbol = countryInfo[0].currencies![indexPath.row].symbol {
            text += symbol
        }
        cell.labelCurrencies!.text = ("Currency:  ") + text
    }
    
    fileprivate func languages(_ indexPath: IndexPath, _ cell: CountryTableViewCell) {
        let text = countryInfo[0].languages![indexPath.row].name! + ", (" + countryInfo[0].languages![indexPath.row].nativeName! + ")"
        cell.labelLanguages!.text = ("Language:  ") + text
    }
    
    /// Function that displays content in cells per row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var identifier: String
        
        switch (indexPath.section) {
        case 0: identifier = "section0Cell"
        case 1: identifier = "section1Cell"
        case 2: identifier = "section2Cell"
        case 3: identifier = "section3Cell"
        case 4: identifier = "section4Cell"
        case 5: identifier = "section5Cell"
        case 6: identifier = "section6Cell"
        default: identifier = ""
        // Make a case in switch of every section.
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CountryTableViewCell
        // Cell for every row.
        
        switch (indexPath) {
        case [0,0]:
            cell.labelCountryName!.text = ("Country Name:  ") + countryInfo[0].name!
            // Cell content country name.
            return cell
        case [1,0]:
            cell.labelAlphaTwo!.text = ("Alpha2 Code:  ") + countryInfo[0].alpha2Code!
            // Cell content country alpha2 code.
            return cell
        case [1,1]:
            cell.labelAlphaThree!.text = ("Alpha3 Code:  ") + countryInfo[0].alpha3Code!
            // Cell content country alpha3 code.
            return cell
        case [1,2]:
            numericCode(cell)
            // Cell content country numeric code with check for emptiness.
            return cell
        case [1,3]:
            cell.labelInternetCodes!.text = ("Internet (Domain) Codes:  ") + countryInfo[0].topLevelDomain!.joined(separator: ", ")
            // Cell content country interenet codes (separated).
            return cell
        case [2,0]:
            cell.labelCallingCodes!.text = ("Calling Codes:  +") + countryInfo[0].callingCodes!.joined(separator: ", ")
            // Cell content country calling codes (separated).
            return cell
        case [2,1]:
            cell.labelTimezones!.text = ("Timezones:  ") + countryInfo[0].timezones!.joined(separator: ", ")
            // Cell content country timezones (separated).
            return cell
        case [3,0]:
            cell.labelCapital!.text = ("Capital:  ") + countryInfo[0].capital!
            // Cell content country capital.
            return cell
        case [3,1]:
            cell.labelRegion!.text = ("Region:  ") + countryInfo[0].region!
            // Cell content country region.
            return cell
        case [3,2]:
            cell.labelSubregion!.text = ("Subregion:  ") + countryInfo[0].subregion!
            // Cell content country subregion.
            return cell
        case [3,3]:
            cell.labelBorders!.text = ("Borders:  ") + countryInfo[0].borders!.joined(separator: ", ")
            // Cell content country borders in alpha3 code (separated).
            return cell
        case [3,4]:
            cell.labelPopulation!.text = ("Population:  ") + "\(String(describing: countryInfo[0].population!))" + (" inhabitants")
            // Cell content country population.
            return cell
        case [3,5]:
            cell.labelDemonym!.text = ("Demonym:  ") + countryInfo[0].demonym!
            // Cell content country demonym.
            return cell
        case [4,indexPath.row]:
            regionalBlocs(indexPath, cell)
            // Cells content country in regional blocs (acronym and name) per row.
            return cell
        case [5,indexPath.row]:
            currency(indexPath, cell)
            // Cells content country in currencies (name, code and symbol) per row with check for emptiness.
            return cell
        case [6,indexPath.row]:
            languages(indexPath, cell)
            // Cells content country in languages (name and native name) per row.
            return cell
        
        default: break
        // Break
        }
        return UITableViewCell()
        // Return content
    }
}
