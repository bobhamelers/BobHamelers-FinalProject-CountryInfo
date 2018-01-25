//
//  ListFeederTableViewController.swift
//  CountryInfo
//
//  Created by Bob Hamelers on 21/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import Firebase
import UIKit

class ListFeederTableViewController: UITableViewController {
    
    // MARK: Properties
    var informations: [Information] = []
    var lists: [List] = []
    var countries: [String] = []
    let ref = Database.database().reference(withPath: "users")
    let userID = Auth.auth().currentUser?.uid
    
    // MARK: Outlets
//    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var titleTextField: UITextField!
    
    // MARK: Actions
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }
//    @IBAction func saveButtonTapped(_ sender: Any) {
//        updateSaveButtonState()
//        self.navigationController?.popViewController(animated: <#T##Bool#>)
//    }
        @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.informations = CountryInfoController.shared.infomations
        print(informations)
    }
    
    func updateSaveButtonState() {
        let titleList = titleTextField.text!
        if titleList == "" {
            createAlert(title: "FAILURE", message: "You have to type a listname in the section above the countries!")
        } else {
            
            let currentUser = self.ref.child(self.userID!)
            let listname = currentUser.child("lists").child(titleList)
            
            for country in countries{
                listname.child(country).child("name").setValue(country)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListFeederCellIdentifier", for: indexPath) as! ListTableViewCell
        configure(cell: cell, forItemAt: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.dequeueReusableCell(withIdentifier: "ListFeederCellIdentifier", for: indexPath) as! ListTableViewCell
        let information = informations[indexPath.row]
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark {
            countries = countries.filter{$0 != information.alpha2Code}
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        } else {
            countries.append(information.alpha2Code!)
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        print(countries)
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let information = informations[indexPath.row]
        cell.textLabel?.text = (information.name! + " (" + information.alpha2Code! + ")")
    }
    
    func createAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        // Alert function for different alerts in SignUp and Login
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        if segue.identifier == "saveUnwind" {
            if segue.destination is ListsTableViewController {
                updateSaveButtonState()
            }
        }
    }
}
