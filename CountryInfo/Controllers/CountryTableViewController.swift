//
//  CountryTableViewController.swift
//  CountryInfo
//
//  Created by Bob Hamelers on 17/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import UIKit

class CountryTableViewController: UITableViewController {

    // MARK: Properties
    let countryInfoController = CountryInfoController()
    var informations = [Information]()
    var countryInfo = [Information]()
    let sectionTitles = ["Name country", "Basic codes of country", "Calling Codes and Timezones", "Basic geographical information", "Regional Partnerships", "Currencies", "Languages"]
//    let numberOfRowsAtSection: [Int] = [1, 4, 2, 6, self.countryInfo.RegionalBlocks.count self.countryInfo.Currencies.count, self.countryInfo.Languages.count]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(countryInfo)
        self.updateUI(with: countryInfo)
    }

    func updateUI(with countryInfo: [Information]) {
        DispatchQueue.main.async {
//            self.information(with: countryInfo)
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }

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
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section >= 0 && section <= 6 {
            return sectionTitles[section]
        }
        return nil
    }
    
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
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CountryTableViewCell
        switch (indexPath) {
        case [0,0]:
            cell.labelCountryName!.text = ("Country Name:  ") + countryInfo[0].name!
            return cell
        case [1,0]:
            cell.labelAlphaTwo!.text = ("Alpha2 Code:  ") + countryInfo[0].alpha2Code!
            return cell
        case [1,1]:
            cell.labelAlphaThree!.text = ("Alpha3 Code:  ") + countryInfo[0].alpha3Code!
            return cell
        case [1,2]:
            cell.labelNumericCode!.text = ("Numeric Code:  ") + countryInfo[0].numericCode!
            return cell
        case [1,3]:
            cell.labelInternetCodes!.text = ("Internet (Domain) Codes:  ") + countryInfo[0].topLevelDomain!.joined(separator: ", ")
            return cell
        case [2,0]:
            cell.labelCallingCodes!.text = ("Calling Codes:  ") + countryInfo[0].callingCodes!.joined(separator: ", ")
            return cell
        case [2,1]:
            cell.labelTimezones!.text = ("Timezones:  ") + countryInfo[0].timezones!.joined(separator: ", ")
            return cell
        case [3,0]:
            cell.labelCapital!.text = ("Capital:  ") + countryInfo[0].capital!
            return cell
        case [3,1]:
            cell.labelRegion!.text = ("Region:  ") + countryInfo[0].region!
            return cell
        case [3,2]:
            cell.labelSubregion!.text = ("Subregion:  ") + countryInfo[0].subregion!
            return cell
        case [3,3]:
            cell.labelBorders!.text = ("Borders (Alpha3Code):  ") + countryInfo[0].borders!.joined(separator: ", ")
            return cell
        case [3,4]:
            cell.labelPopulation!.text = ("Population:  ") + "\(String(describing: countryInfo[0].population!))" + (" inhabitants")
            return cell
        case [3,5]:
            cell.labelDemonym!.text = ("Demonym:  ") + countryInfo[0].demonym! + (" people")
            return cell
        case [4]:
//            for cellOnly in 0..<(countryInfo[0].regionalBlocs!.count) {
//                let text = countryInfo[0].regionalBlocs![cellOnly].acronym! + ", " + countryInfo[0].regionalBlocs![cellOnly].name!
//                cell.labelRegionalBlocs!.text = ("Regional Bloc:  ") + text
//                return cell
//            }
            
            let text = countryInfo[0].regionalBlocs![indexPath.row].acronym! + ", " + countryInfo[0].regionalBlocs![indexPath.row].name!
            cell.labelRegionalBlocs!.text = ("Regional Bloc:  ") + text
            return cell
        case [5]:
            let text = countryInfo[0].currencies![indexPath.row].name! + ", " + countryInfo[0].currencies![indexPath.row].code! + ", " + countryInfo[0].currencies![indexPath.row].symbol!
            cell.labelCurrencies!.text = ("Currency:  ") + text
            return cell
        case [6]:
            let text = countryInfo[0].languages![indexPath.row].name! + ", (" + countryInfo[0].languages![indexPath.row].nativeName! + ")"
            cell.labelLanguages!.text = ("Language:  ") + text
            return cell
        
        default: break
            
        }
        return UITableViewCell()
    }
}
