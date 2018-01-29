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
    
    /// MARK: ViewDidLoad standard.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.informations = CountryInfoController.shared.infomations
        // MARK: Store information of all countries in informations.
        
        for countryOnly in 0..<(listInfo[0].countryIsAlphaCode2.count){
            countries.append(listInfo[0].countryIsAlphaCode2[countryOnly])
            // MARK: Get an array of countries (based on alpha2 code) from the right list.
        }
    }
    
    /// MARK: Save button update function to FireBase.
    func updateSaveButtonState() {
        
        let currentUser = self.ref.child(self.userID!)
        let listname = currentUser.child("lists").child(listInfo[0].listName)
        // MARK: Get current user and the right listname from FireBase.
        
        listname.ref.removeValue()
        // MARK: Delete the old list from FireBase.
        
        for country in countries{
            listname.child(country).child("name").setValue(country)
            // MARK: add new countries in right list to FireBase.
        }
    }
    
    /// MARK: Function that handles memory warnings.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // MARK: Dispose of any resources that can be recreated.
    }
    
    /// MARK: Function that displays rows per section.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informations.count
    }
    
    /// MARK: Function that displays content in cells per row.
    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListChangerCellIdentifier", for: indexPath) as! ListTableViewCell
        // MARK: Cell for every row.
        
        configure(cell: cell, forItemAt: indexPath)
        // MARK: Call to configure function for cell content.
        
        cell.accessoryType = .none
        for country in (0..<countries.count) {
            if informations[indexPath.row].alpha2Code == countries[country] {
                cell.accessoryType = .checkmark
                // MARK: Set checkmarks on none except for rows with country information from array countries.
            }
        }
        return cell
    }
    
    /// MARK: Function that add countries to array and set checkmarks when clicked on row.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListChangerCellIdentifier", for: indexPath) as! ListTableViewCell
        let information = informations[indexPath.row]
        // MARK: Cell for every row and indexpath.
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            countries = countries.filter{$0 != information.alpha2Code}
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            // MARK: Checkmark off and delete country from countries array.
        } else {
            countries.append(information.alpha2Code!)
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            // MARK: Checkmark on and add country to countries array.
        }
    }
    
    /// MARK: Function for cell content.
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let information = informations[indexPath.row]
        cell.textLabel?.text = (information.name! + " (" + information.alpha2Code! + ")")
        // MARK: Cell content.
    }
    
    /// MARK: Function that prepares unwind segue for ListsTableViewController when an user clicks on save button and call of function updateSaveButtonState.
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        if segue.identifier == "saveUnwind" {
            if segue.destination is ListsTableViewController {
            // MARK: Prepare for ListsTableViewController.
                updateSaveButtonState()
                // MARK: Call for updateSaveButtonState.
                
            }
        }
    }
}
