//
//  ListChangerTableViewController.swift
//  CountryInfo
//
//  This Controller gives the possibility for an user to change a list of their own.
//  An user can deselect selected countries and can select new countries.
//  If an user don't has any countries selected, the list will be deleted.
//  The list with countries is stored in FireBase by the personal authentication of an user.
//
//  Created by Bob Hamelers on 21/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import Firebase
import UIKit

class ListChangerTableViewController: UITableViewController {

    // MARK: Properties.
    var informations: [Information] = []
    var countries: [String] = []
    var dataList = [Information]()
    var listInfo: [List] = []
    let ref = Database.database().reference(withPath: "users")
    let userID = Auth.auth().currentUser?.uid
    
    /// ViewDidLoad standard.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.informations = CountryInfoController.shared.infomations
        // Store information of all countries in informations.
        
        for countryOnly in 0..<(listInfo[0].countryIsAlphaCode2.count){
            countries.append(listInfo[0].countryIsAlphaCode2[countryOnly])
            // Get an array of countries (based on alpha2 code) from the right list.
        }
    }
    
    /// Save button update function to FireBase.
    func updateSaveButtonState() {
        
        let currentUser = self.ref.child(self.userID!)
        let listname = currentUser.child("lists").child(listInfo[0].listName)
        // Get current user and the right listname from FireBase.
        
        listname.ref.removeValue()
        // Delete the old list from FireBase.
        
        for country in countries{
            listname.child(country).child("name").setValue(country)
            // Add new countries in right list to FireBase.
        }
    }
    
    /// Function that displays rows per section.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informations.count
    }
    
    /// Function that displays content in cells per row.
    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListChangerCellIdentifier", for: indexPath) as! ListTableViewCell
        // Cell for every row.
        
        configure(cell: cell, forItemAt: indexPath)
        // Call to configure function for cell content.
        
        cell.accessoryType = .none
        for country in (0..<countries.count) {
            if informations[indexPath.row].alpha2Code == countries[country] {
                cell.accessoryType = .checkmark
                // Set checkmarks on none except for rows with country information from array countries.
            }
        }
        return cell
    }
    
    /// Function that add countries to array and set checkmarks when clicked on row.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let information = informations[indexPath.row]
        // Cell for every row and indexpath.
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            countries = countries.filter{$0 != information.alpha2Code}
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            // Checkmark off and delete country from countries array.
        } else {
            countries.append(information.alpha2Code!)
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            // Checkmark on and add country to countries array.
        }
    }
    
    /// Function for cell content.
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let information = informations[indexPath.row]
        cell.textLabel?.text = (information.name! + " (" + information.alpha2Code! + ")")
        // Cell content.
    }
    
    /// Function that prepares unwind segue for ListsTableViewController when an user clicks on save button and call of function updateSaveButtonState.
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        if segue.identifier == "saveUnwind" {
            if segue.destination is ListsTableViewController {
            // Prepare for ListsTableViewController.
                updateSaveButtonState()
                // Call for updateSaveButtonState.
                
            }
        }
    }
}
