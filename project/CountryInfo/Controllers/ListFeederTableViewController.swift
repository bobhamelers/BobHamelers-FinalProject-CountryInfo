//
//  ListFeederTableViewController.swift
//  CountryInfo
//
//  This Controller gives the possibility for an user to add a list for their own.
//  An user can (de)select new countries.
//  If an user don't has any countries selected, the list will not be added.
//  Next to that, a list needs a listname and will not be added otherwise.
//  The list with countries is stored in FireBase by the personal authentication of an user.
//
//  Created by Bob Hamelers on 21/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import Firebase
import UIKit

class ListFeederTableViewController: UITableViewController {
    
    // MARK: Properties.
    var informations: [Information] = []
    var countries: [String] = []
    var lists: [List] = []
    let ref = Database.database().reference(withPath: "users")
    let userID = Auth.auth().currentUser?.uid
    
    // MARK: Outlets.
    @IBOutlet weak var titleTextField: UITextField!
    
    // MARK: Actions.
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }
    
    /// ViewDidLoad standard.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.informations = CountryInfoController.shared.infomations
        // Store information of all countries in informations.
    }
    
    /// Save button update function to FireBase.
    func updateSaveButtonState() {
        let titleList = titleTextField.text!
        if titleList == "" {
            createAlert(title: "FAILURE", message: "You have to type a listname in the section above the countries!")
            // Alert if there is no new listname written.
        } else if countries.count == 0{
            createAlert(title: "FAILURE", message: "You have not selected any country!")
            // Alert if there are no countries selected.
        } else {
            
            let currentUser = self.ref.child(self.userID!)
            let listname = currentUser.child("lists").child(titleList)
            // Get current user and the right listname from FireBase.
            
            for country in countries{
                listname.child(country).child("name").setValue(country)
                // Add new countries in right list to FireBase.
            }
        }
    }
    
    /// Function that displays rows per section.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informations.count
    }
    
    /// Function that displays content in cells per row.
    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListFeederCellIdentifier", for: indexPath) as! ListTableViewCell
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
    
    fileprivate func tableContent(_ tableView: UITableView, _ indexPath: IndexPath, _ information: Information) {
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
    
    /// Function that add countries to array and set checkmarks when clicked on row.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let information = informations[indexPath.row]
        tableContent(tableView, indexPath, information)
    }
    
    /// Function for cell content.
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let information = informations[indexPath.row]
        cell.textLabel?.text = (information.name! + " (" + information.alpha2Code! + ")")
        // Cell content.
    }
    
    /// Create alert function that displays a popup.
    func createAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        // Alert function with title (Okay) and message for different alerts.
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
