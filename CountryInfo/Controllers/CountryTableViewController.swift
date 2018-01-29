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
import SwiftSVG

class CountryTableViewController: UITableViewController {

    // MARK: Properties.
    let countryInfoController = CountryInfoController()
    let sectionTitles = ["Name country", "Basic codes of country", "Calling Codes and Timezones", "Basic geographical information", "Regional Partnerships", "Currencies", "Languages"]
    var informations = [Information]()
    var countryInfo = [Information]()
    
    // MARK: Outlets.
    @IBOutlet weak var placeholderView: UIView!
    
    // MARK: Actions.
    /// MARK: Fuction that connects to a country map in maps.
    @IBAction func didTapOpenInMaps(_ sender: Any) {
        
        
        let alink = countryInfo[0].name!.replacingOccurrences(of: "[áäâàæãåāÁÄÂÀÆÃÅĀ]", with: "a",options: .regularExpression)
        let clink = alink.replacingOccurrences(of: "[çÇ]", with: "c",options: .regularExpression)
        let elink = clink.replacingOccurrences(of: "[éëêèęėēÉËÊÈĘĖĒ]", with: "e",options: .regularExpression)
        let ilink = elink.replacingOccurrences(of: "[íïìîįīÍÏÌÎĮĪ]", with: "i",options: .regularExpression)
        let olink = ilink.replacingOccurrences(of: "[óöôòõœøōÓÖÔÒÕŒØŌ]", with: "o",options: .regularExpression)
        let ulink = olink.replacingOccurrences(of: "[úüûùūÚÜÛÙŪ]", with: "u",options: .regularExpression)
        // MARK: Take care of specific characters to avoid an error.
        
        let link = ulink.replacingOccurrences(of: " ", with: "%20")
        UIApplication.shared.open(NSURL(string: "https://maps.apple.com/?address=\(link)")! as URL, options: [:])
        // MARK: Go to the specific country URL in maps.
    }
    
    /// MARK: ViewDidLoad standard.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI(with: countryInfo)
//        self.countryImageView(with: countryInfo)
    }

    /// MARK: Function that is called to reload TableView.
    func updateUI(with countryInfo: [Information]) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    /// MARK: Functions that is called to display the country flag.
    func countryImageView(with countryInfo: [Information]) {
        
        let link = countryInfo[0].flag!
        let svgURL = URL(string: link)!
        let hammock = UIView(SVGURL: svgURL) { (svgLayer) in
            svgLayer.resizeToFit(self.view.bounds)
        }
//        self.view.layer.addSublayer(hammock)
        self.placeholderView.addSubview(hammock)
        // MARK: Convert SVG image from URL into a View in Controller.
    }

    /// MARK: Function that handles memory warnings.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // MARK: Dispose of any resources that can be recreated.
    }

    /// MARK: Function that displays amount of sections.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }

    /// MARK: Function that displays rows per section.
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
    
    /// MARK: Function that displays headers per section from sectionTitles array.
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section >= 0 && section <= 6 {
            return sectionTitles[section]
        }
        return nil
    }
    
    /// MARK: Function that displays content in cells per row.
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
        // MARK: Make a case in switch of every section.
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CountryTableViewCell
        // MARK: Cell for every row.
        
        switch (indexPath) {
        case [0,0]:
            cell.labelCountryName!.text = ("Country Name:  ") + countryInfo[0].name!
            // MARK: Cell content country name.
            return cell
        case [1,0]:
            cell.labelAlphaTwo!.text = ("Alpha2 Code:  ") + countryInfo[0].alpha2Code!
            // MARK: Cell content country alpha2 code.
            return cell
        case [1,1]:
            cell.labelAlphaThree!.text = ("Alpha3 Code:  ") + countryInfo[0].alpha3Code!
            // MARK: Cell content country alpha3 code.
            return cell
        case [1,2]:
            var text = ""
            if let numericCode = countryInfo[0].numericCode {
                text += numericCode
            }
            cell.labelNumericCode!.text = ("Numeric Code:  ") + text
            // MARK: Cell content country numeric code with check for emptiness.
            return cell
        case [1,3]:
            cell.labelInternetCodes!.text = ("Internet (Domain) Codes:  ") + countryInfo[0].topLevelDomain!.joined(separator: ", ")
            // MARK: Cell content country interenet codes (separated).
            return cell
        case [2,0]:
            cell.labelCallingCodes!.text = ("Calling Codes:  +") + countryInfo[0].callingCodes!.joined(separator: ", ")
            // MARK: Cell content country calling codes (separated).
            return cell
        case [2,1]:
            cell.labelTimezones!.text = ("Timezones:  ") + countryInfo[0].timezones!.joined(separator: ", ")
            // MARK: Cell content country timezones (separated).
            return cell
        case [3,0]:
            cell.labelCapital!.text = ("Capital:  ") + countryInfo[0].capital!
            // MARK: Cell content country capital.
            return cell
        case [3,1]:
            cell.labelRegion!.text = ("Region:  ") + countryInfo[0].region!
            // MARK: Cell content country region.
            return cell
        case [3,2]:
            cell.labelSubregion!.text = ("Subregion:  ") + countryInfo[0].subregion!
            // MARK: Cell content country subregion.
            return cell
        case [3,3]:
            cell.labelBorders!.text = ("Borders (Alpha3Code):  ") + countryInfo[0].borders!.joined(separator: ", ")
            // MARK: Cell content country borders in alpha3 code (separated).
            return cell
        case [3,4]:
            cell.labelPopulation!.text = ("Population:  ") + "\(String(describing: countryInfo[0].population!))" + (" inhabitants")
            // MARK: Cell content country population.
            return cell
        case [3,5]:
            cell.labelDemonym!.text = ("Demonym:  ") + countryInfo[0].demonym!
            // MARK: Cell content country demonym.
            return cell
        case [4,indexPath.row]:
            let text = countryInfo[0].regionalBlocs![indexPath.row].acronym! + ", " + countryInfo[0].regionalBlocs![indexPath.row].name!
            cell.labelRegionalBlocs!.text = ("Regional Bloc:  ") + text
            // MARK: Cells content country in regional blocs (acronym and name) per row.
            return cell
        case [5,indexPath.row]:
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
            // MARK: Cells content country in currencies (name, code and symbol) per row with check for emptiness.
            return cell
        case [6,indexPath.row]:
            let text = countryInfo[0].languages![indexPath.row].name! + ", (" + countryInfo[0].languages![indexPath.row].nativeName! + ")"
            cell.labelLanguages!.text = ("Language:  ") + text
            // MARK: Cells content country in languages (name and native name) per row.
            return cell
        
        default: break
        // MARK: break
        }
        return UITableViewCell()
        // MARK: Return content
    }
}
