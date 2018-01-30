//
//  ListsTableViewController.swift
//  CountryInfo
//
//  This Controller displays every list from a current user's FireBase.
//  An user can add a list if he/she clicks on the plus button.
//  If an user clicks on a list he/she will see the details of that specific list.
//
//  Created by Bob Hamelers on 18/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import Firebase
import UIKit

class ListsTableViewController: UITableViewController {
    
    // MARK: Properties.
    var lists = [List]()
    let ref = Database.database().reference(withPath: "users")
    let userID = Auth.auth().currentUser?.uid
    
    // MARK: Actions.
    @IBAction func unwindToListChanger(segue: UIStoryboardSegue) {
    }
    @IBAction func unwindToListFeeder(segue: UIStoryboardSegue) {
    }
    
    /// ViewDidLoad standard.
    override func viewDidLoad() {
        super.viewDidLoad()

        // Get lists from current user from FireBase and add lists.
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
            }
        }
    }

    /// Function that displays amount of sections.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    /// Function that displays rows per section.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }

    /// Function that displays content in cells per row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListsCellIdentifier", for: indexPath) as! ListsTableViewCell
        // Cell for every row.
        
        cell.titleLabel?.text = lists[indexPath.row].listName
        // Cell content.
        return cell
    }

    /// Function to accept edit rows for possibility to delete lists.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    /// Function that handles editing rows (deleting rows).
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let list = lists[indexPath.row]
            list.ref?.removeValue()
            lists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            // If delete is touched, delete from array lists, from FireBase and from TableView.
        }
    }
    
    /// Function that prepares segue for ListTableViewController when an user clicks on a list and send information of that specific list.
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        if segue.identifier == "showListDetails" {
            let index = self.tableView.indexPathForSelectedRow!.row
            let ListTableViewController = segue.destination
                as! ListTableViewController
            // Prepare for ListTableViewController.
            
            ListTableViewController.listInfo = [self.lists[index]]
            // Send specific list information.
        }
    }
}

