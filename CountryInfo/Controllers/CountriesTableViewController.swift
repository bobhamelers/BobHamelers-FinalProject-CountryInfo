//
//  CountriesTableViewController.swift
//  CountryInfo
//
//  Created by Bob Hamelers on 15/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import Firebase
import UIKit

class CountriesTableViewController: UITableViewController {
    
    // MARK: Properties
    let countryInfoController = CountryInfoController()
    var informations = [Information]()

    
    // MARK: Actions
    @IBAction func logoutDidTouch(_ sender: AnyObject) {
        try! Auth.auth().signOut()
        dismiss(animated: true, completion: nil)
        // Log out and go back to LoginViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryInfoController.fetchCompletion { (info) in
            if let info = info {
                self.updateUI(with: info)
                }
            }
        }
    
    func updateUI(with info: [Information]) {
        DispatchQueue.main.async {
            self.informations = info
            self.tableView.reloadData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesCellIdentifier", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let information = informations[indexPath.row]
        cell.textLabel?.text = information.name
    }
}
