//
//  CountriesTableViewController.swift
//  CountryInfo
//
//  Created by Bob Hamelers on 15/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import Firebase
import UIKit

class CountriesTableViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: Properties
    let countryInfoController = CountryInfoController()
    var informations = [Information]()
    var filteredData = [Information]()
    var isSearching = false

    // MARK: Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: Actions
    @IBAction func logoutDidTouch(_ sender: AnyObject) {
        try! Auth.auth().signOut()
        dismiss(animated: true, completion: nil)
        // Log out and go back to LoginViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CountryInfoController.shared.fetchCompletion { (info) in
            if let info = info {
                self.updateUI(with: info)
                }
            }
        
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.search
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
        
        if isSearching {
            return filteredData.count
        }
        else {
            return informations.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesCellIdentifier", for: indexPath)
        if isSearching {
            cell.textLabel?.text = filteredData[indexPath.row].name!
        }
        else{
            configure(cell: cell, forItemAt: indexPath)
        }
        return cell
    }
//        configure(cell: cell, forItemAt: indexPath)
//        return cell
//    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let information = informations[indexPath.row]
        cell.textLabel?.text = (information.name! + " (" + information.alpha2Code! + ")")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false

            view.endEditing(true)

            tableView.reloadData()
        } else {
            isSearching = true

            filteredData = informations.filter({$0.name!.contains(searchBar.text as! String) || $0.alpha2Code!.lowercased() == searchBar.text?.lowercased() as! String})

            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        if segue.identifier == "CountrySegue" {
            let index = self.tableView.indexPathForSelectedRow!.row
            let CountryTableViewController = segue.destination as!
            CountryTableViewController
            if isSearching {
                CountryTableViewController.countryInfo = [filteredData[index]]
            } else {
                CountryTableViewController.countryInfo = [informations[index]]
            }
        }
        // Prepare for CountryViewController
    }
}
