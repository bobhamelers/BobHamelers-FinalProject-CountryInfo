//
//  ListsTableViewController.swift
//  CountryInfo
//
//  Created by Bob Hamelers on 18/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import Firebase
import UIKit

class ListsTableViewController: UITableViewController {
    
    // MARK: Constants
    let listToUsers = "ListToUsers"
    
    // MARK: Properties
    var lists: [List] = []
    let ref = Database.database().reference(withPath: "users")
    let userID = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let currentUser = self.ref.child(self.userID!)
        currentUser.child("lists").observe(.value) { (snapshot) in
            if let getData = snapshot.value as? [String:Any] {
                var newLists : [List] = []
                
                for item in snapshot.children {
                    let list = List(snapshot: item as! DataSnapshot)
                    newLists.append(list)
                }
                self.lists = newLists
                self.tableView.reloadData()
                print(self.lists)
            }
            else {
                print("not found data")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListsTableViewCell
        
        cell.titleLabel?.text = lists[indexPath.row].listName
        return cell
    }

        override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let list = lists[indexPath.row]
            list.ref?.removeValue()
        }
    }

    @IBAction func unwindToListFeeder(segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        if segue.identifier == "showListDetails" {
            let index = self.tableView.indexPathForSelectedRow!.row
            let ListTableViewController = segue.destination
                as! ListTableViewController
            ListTableViewController.listInfo = [lists[index]]
        }
    }
}

