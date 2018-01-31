//
//  ListTableViewController.swift
//  CountryInfo
//
//  This Controller displays specific information of a list.
//  An user can search a country on (English) name, on alphacode2 and on alphacode3.
//  Below that it displays countries that are clickable.
//  In the right upper front, an user can click on edit to change the countries in the list.
//
//  Created by Bob Hamelers on 21/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: Properties.
    var informations: [Information] = []
    var filteredData = [Information]()
    var data = [Information]()
    var listInfo: [List] = []
    var isSearching = false
    
    // MARK: Outlets.
    @IBOutlet weak var searchBar: UISearchBar!

    /// ViewDidLoad standard.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.informations = CountryInfoController.shared.infomations
        // Store information of all countries in informations.
        
        // Make searchBar (delegate and returnKeyType Keyboard).
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.search
        
        for countryOnly in 0..<(listInfo[0].countryIsAlphaCode2.count) {
            let dataTemporarily = informations.filter({$0.alpha2Code!.lowercased() == listInfo[0].countryIsAlphaCode2[countryOnly].lowercased()})
            data.append(dataTemporarily[0])
            // Get an array of countries (based on alpha2 code) that are selected for this specific list.
        }
    }

    /// Function that displays rows per section (depending on searching or only looking).
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching {
            return filteredData.count
            // Amount of rows when user is searching.
        }
        else {
            return data.count
            // Amount of rows when user is only looking.
        }
    }
    
    /// Function that displays content in cells per row (depending on searching or only looking).
    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCellIdentifier", for: indexPath)
        // Cell for every row.
        
        if isSearching {
            cell.textLabel?.text = (filteredData[indexPath.row].name! + " (" + filteredData[indexPath.row].alpha2Code! + ")" )
            // Cell content when user is searching.
        }
        else{
            configure(cell: cell, forItemAt: indexPath)
            // Call to configure function for cell content when user is looking.
        }
        return cell
        // Return cell content.
    }
    
    /// Function for cell content when looking.
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let information = data[indexPath.row]
        cell.textLabel?.text = (information.name! + " (" + information.alpha2Code! + ")")
        // Cell content when user is looking.
    }
    
    /// Search function.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            
            view.endEditing(true)
            
            tableView.reloadData()
            // Reload TableView when searchbar is empty and start editing possibilities.
        } else {
            isSearching = true
            
            filteredData = data.filter({$0.name!.contains(searchBar.text as! String) || $0.alpha2Code!.lowercased() == searchBar.text?.lowercased() as! String || $0.alpha3Code!.lowercased() == searchBar.text?.lowercased() as! String})
            
            tableView.reloadData()
            // Reload TableView when user is searching with the filtered data. An user can search through data with the (English) name of a country and it's alphacodes.
        }
    }
    
    /// Function that prepares segue for ListChangerTableViewController or CountryTableViewController when an user clicks on edit or on a country and send information of that specific list or country.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChangeSegue" {
            let ListChangerTableViewController = segue.destination as!
            ListChangerTableViewController
            // Prepare for ListChangerTableViewController.
            
            ListChangerTableViewController.dataList = data
            ListChangerTableViewController.listInfo = listInfo
            // Send specific list information.
        }
        if segue.identifier == "CountrySegue" {
            let index = self.tableView.indexPathForSelectedRow!.row
            let CountryTableViewController = segue.destination as!
            CountryTableViewController
            // Prepare for CountryViewController.
            
            if isSearching {
                CountryTableViewController.countryInfo = [filteredData[index]]
            } else {
                CountryTableViewController.countryInfo = [data[index]]
            }
            // Send specific country information.
        }
    }
}
