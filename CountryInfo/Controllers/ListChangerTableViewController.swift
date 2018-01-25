//
//  ListChangerTableViewController.swift
//  CountryInfo
//
//  Created by Bob Hamelers on 21/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import Firebase
import UIKit

class ListChangerTableViewController: UITableViewController {

    // MARK: Properties
    var informations: [Information] = []
    var countries: [String] = []
    var dataList = [Information]()
    var listInfo: [List] = []
    let ref = Database.database().reference(withPath: "users")
    let userID = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.informations = CountryInfoController.shared.infomations
//        print(informations)
        
        print("HELLO1")
        
        print(dataList)
        print("HELLO2")
        print(listInfo)
        
        for countryOnly in 0..<(listInfo[0].countryIsAlphaCode2.count){
            countries.append(listInfo[0].countryIsAlphaCode2[countryOnly])
            print("Hello3")
            print(countries)
        }
        
    }
    
    func updateSaveButtonState() {
        
        let currentUser = self.ref.child(self.userID!)
        let listname = currentUser.child("lists").child(listInfo[0].listName)
        
        listname.ref.removeValue()
        
        for country in countries{
            listname.child(country).child("name").setValue(country)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListChangerCellIdentifier", for: indexPath) as! ListTableViewCell
        configure(cell: cell, forItemAt: indexPath)
        
        for country in (0..<countries.count) {
            if informations[indexPath.row].alpha2Code == countries[country] {
                cell.accessoryType = .checkmark
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListChangerCellIdentifier", for: indexPath) as! ListTableViewCell
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
    
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        if segue.identifier == "saveUnwind" {
            if segue.destination is ListsTableViewController {
                updateSaveButtonState()
            }
        }
    }
}
