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
    
//    func information(with countryInfo: [Information]) {
//        labelCountryName.text = countryInfo[0].name
//
//        labelAlphaTwo.text = countryInfo[0].alpha2Code
//        labelAlphaThree.text = countryInfo[0].alpha3Code
//        labelNumericCode.text = countryInfo[0].numericCode
//        labelInternetCodes.text = countryInfo[0].topLevelDomain!.joined(separator: ", ")
//
//        labelCallingCodes.text = countryInfo[0].callingCodes!.joined(separator: ", ")
//        labelTimezones.text = countryInfo[0].timezones!.joined(separator: ", ")
//
//        labelCapital.text = countryInfo[0].capital
//        labelRegion.text = countryInfo[0].region
//        labelSubregion.text = countryInfo[0].subregion
//        labelBorders.text = countryInfo[0].borders!.joined(separator: ", ")
//        labelPopulation.text = "\(String(describing: countryInfo[0].population))"
//        labelDemonym.text = countryInfo[0].demonym
//
//        let countOne = countryInfo.first?.regionalBlocs!.count
//        let countTwo = countryInfo.first?.currencies!.count
//        let countThree = countryInfo.first?.languages!.count
//
//        labelRegionalBlocs.text = countryInfo[0].regionalBlocs
//        labelCurrencies.text = countryInfo[0].currencies
//        labelLanguages.text = countryInfo[0].languages
//    }

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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CountryTableViewCell
        switch (indexPath.section) {
        case 0:
            cell.labelCountryName!.text = countryInfo[0].name
            return cell
        case 1:
            cell.labelAlphaTwo!.text = countryInfo[0].alpha2Code
            cell.labelAlphaThree!.text = countryInfo[0].alpha3Code
            cell.labelNumericCode!.text = countryInfo[0].numericCode
            cell.labelInternetCodes!.text = countryInfo[0].topLevelDomain!.joined(separator: ", ")
            return cell
        case 2:
            cell.labelCallingCodes!.text = countryInfo[0].callingCodes!.joined(separator: ", ")
            cell.labelTimezones!.text = countryInfo[0].timezones!.joined(separator: ", ")
            return cell
        case 3:
            cell.labelCapital!.text = countryInfo[0].capital
            cell.labelRegion!.text = countryInfo[0].region
            cell.labelSubregion!.text = countryInfo[0].subregion
            cell.labelBorders!.text = countryInfo[0].borders!.joined(separator: ", ")
            cell.labelPopulation!.text = "\(String(describing: countryInfo[0].population))"
            cell.labelDemonym!.text = countryInfo[0].demonym
            return cell
        case 4:
//            let countOne = countryInfo.first?.regionalBlocs!.count
            cell.labelRegionalBlocs!.text = countryInfo[0].regionalBlocs! as? String
            return cell
        case 5:
//            let countTwo = countryInfo.first?.currencies!.count
            print(countryInfo[0].currencies!)
            cell.labelCurrencies!.text = countryInfo[0].currencies! as? String
            return cell
        case 6:
//            let countThree = countryInfo.first?.languages!.count
            cell.labelLanguages!.text = countryInfo[0].languages! as? String
            return cell
        
        default: break
            
        }
        return UITableViewCell()
    }
}
