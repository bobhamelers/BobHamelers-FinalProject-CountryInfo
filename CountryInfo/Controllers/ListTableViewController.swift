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

    /// MARK: ViewDidLoad standard.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.informations = CountryInfoController.shared.infomations
        // MARK: Store information of all countries in informations.
        
        // MARK: Make searchBar (delegate and returnKeyType Keyboard).
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.search
        
        for countryOnly in 0..<(listInfo[0].countryIsAlphaCode2.count) {
            let dataTemporarily = informations.filter({$0.alpha2Code!.lowercased() == listInfo[0].countryIsAlphaCode2[countryOnly].lowercased()})
            data.append(dataTemporarily[0])
            // MARK: Get an array of countries (based on alpha2 code) that are selected for this specific list.
        }
    }

    /// MARK: Function that handles memory warnings.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // MARK: Dispose of any resources that can be recreated.
    }

    /// MARK: Function that displays rows per section (depending on searching or only looking).
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching {
            return filteredData.count
            // MARK: Amount of rows when user is searching.
        }
        else {
            return data.count
            // MARK: Amount of rows when user is only looking. 
        }
    }
    
    /// MARK: Function that displays content in cells per row (depending on searching or only looking).
    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCellIdentifier", for: indexPath)
        // MARK: Cell for every row.
        
        if isSearching {
            cell.textLabel?.text = filteredData[indexPath.row].name!
            // MARK: Cell content when user is searching.
        }
        else{
            configure(cell: cell, forItemAt: indexPath)
            // MARK: Call to configure function for cell content when user is looking.
        }
        return cell
        // MARK: Return cell content.
    }
    
    /// MARK: Function for cell content when looking.
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let information = data[indexPath.row]
        cell.textLabel?.text = (information.name! + " (" + information.alpha2Code! + ")")
        // MARK: Cell content when user is looking.
    }
    
    /// MARK: Search function.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            
            view.endEditing(true)
            
            tableView.reloadData()
            // MARK: Reload TableView when searchbar is empty and start editing possibilities.
        } else {
            isSearching = true
            
            filteredData = data.filter({$0.name!.contains(searchBar.text as! String) || $0.alpha2Code!.lowercased() == searchBar.text?.lowercased() as! String || $0.alpha3Code!.lowercased() == searchBar.text?.lowercased() as! String})
            
            tableView.reloadData()
            // MARK: Reload TableView when user is searching with the filtered data. An user can search through data with the (English) name of a country and it's alphacodes.
        }
    }
    
    /// MARK: Function that prepares segue for ListChangerTableViewController or CountryTableViewController when an user clicks on edit or on a country and send information of that specific list or country.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChangeSegue" {
            let ListChangerTableViewController = segue.destination as!
            ListChangerTableViewController
            // MARK: Prepare for ListChangerTableViewController.
            
            ListChangerTableViewController.dataList = data
            ListChangerTableViewController.listInfo = listInfo
            // MARK: Send specific list information.
        }
        if segue.identifier == "CountrySegue" {
            let index = self.tableView.indexPathForSelectedRow!.row
            let CountryTableViewController = segue.destination as!
            CountryTableViewController
            // MARK: Prepare for CountryViewController.
            
            if isSearching {
                CountryTableViewController.countryInfo = [filteredData[index]]
            } else {
                CountryTableViewController.countryInfo = [data[index]]
            }
            // MARK: Send specific country information.
        }
    }
}
