//
//  CountriesTableViewController.swift
//  CountryInfo
//
//  This Controller displays every country from a JSON API from CountryInfoController.
//  An user can search a country on (English) name, on alphacode2 and on alphacode3.
//  If an user clicks on a country he/she will see the details of that specific country.
//
//  Created by Bob Hamelers on 15/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import UIKit
import Firebase

class CountriesTableViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: Properties.
    let countryInfoController = CountryInfoController()
    var informations = [Information]()
    var filteredData = [Information]()
    var isSearching = false

    // MARK: Outlets.
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: Actions.
    /// Log out and go back to LoginViewController.
    @IBAction func logoutDidTouch(_ sender: AnyObject) {
        try! Auth.auth().signOut()
        dismiss(animated: true, completion: nil)
    }
    
    /// ViewDidLoad standard.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call to fetchCompletion function in CountryInfoController for JSON API.
        CountryInfoController.shared.fetchCompletion { (info) in
            if let info = info {
                self.updateUI(with: info)
                }
            }
        
        // Make searchBar (delegate and returnKeyType Keyboard).
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.search
    }
    /// Function that is called after fetchCompletion.
    func updateUI(with info: [Information]) {
        DispatchQueue.main.async {
            self.informations = info
            self.tableView.reloadData()
        }
    }

    /// Function that displays rows per section (depending on searching or only looking).
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching {
            return filteredData.count
            // Amount of rows when user is searching.
        }
        else {
            return informations.count
            // Amount of rows when user is only looking.
        }
    }
    
    /// Function that displays content in cells per row (depending on searching or only looking).
    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesCellIdentifier", for: indexPath)
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
    
    /// Search function.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false

            view.endEditing(true)

            tableView.reloadData()
            // Reload TableView when searchbar is empty and start editing possibilities.
        } else {
            isSearching = true

            filteredData = informations.filter({$0.name!.contains(searchBar.text as! String) || $0.alpha2Code!.lowercased() == searchBar.text?.lowercased() as! String || $0.alpha3Code!.lowercased() == searchBar.text?.lowercased() as! String})

            tableView.reloadData()
            // Reload TableView when user is searching with the filtered data. An user can search through data with the (English) name of a country and it's alphacodes.
        }
    }
    
    /// Function for cell content when looking.
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let information = informations[indexPath.row]
        cell.textLabel?.text = (information.name! + " (" + information.alpha2Code! + ")")
        // Cell content when user is looking.
    }
    
    /// Function that prepares segue for CountryTableViewController when an user clicks on a country and send information of that specific country.
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        if segue.identifier == "CountrySegue" {
            let index = self.tableView.indexPathForSelectedRow!.row
            let CountryTableViewController = segue.destination as!
            CountryTableViewController
            // Prepare for CountryViewController.
            
            if isSearching {
                CountryTableViewController.countryInfo = [filteredData[index]]
            } else {
                CountryTableViewController.countryInfo = [informations[index]]
            }
            // Send specific country information.
        }
    }
}
