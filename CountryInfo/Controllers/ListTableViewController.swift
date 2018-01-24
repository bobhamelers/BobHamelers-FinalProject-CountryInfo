//
//  ListTableViewController.swift
//  CountryInfo
//
//  Created by Bob Hamelers on 21/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: Properties
    var informations: [Information] = []
    var filteredData = [Information]()
    var data = [Information]()
    var listInfo: [List] = []
    var isSearching = false
    
    // MARK: Outlets
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.informations = CountryInfoController.shared.infomations
//        print(informations)
//        print(listInfo)
        
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.search
        
        for countryOnly in 0..<(listInfo[0].countryIsAlphaCode2.count) {
            let dataTemporarily = informations.filter({$0.alpha2Code!.lowercased() == listInfo[0].countryIsAlphaCode2[countryOnly].lowercased()})
            data.append(dataTemporarily[0])
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
            return data.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCellIdentifier", for: indexPath)
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
        let information = data[indexPath.row]
        cell.textLabel?.text = (information.name! + " (" + information.alpha2Code! + ")")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            
            view.endEditing(true)
            
            tableView.reloadData()
        } else {
            isSearching = true
            
            filteredData = data.filter({$0.name!.contains(searchBar.text as! String) || $0.alpha2Code!.lowercased() == searchBar.text?.lowercased() as! String})
            
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChangeSegue" {
            let index = self.tableView.indexPathForSelectedRow!.row
            let ListChangerTableViewController = segue.destination as!
            ListChangerTableViewController
            ListChangerTableViewController.dataList = data
            ListChangerTableViewController.listInfo = listInfo
        }
    }
}
