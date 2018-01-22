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
    var lists = [List]()
    let ref = Database.database().reference(withPath: "lists")
    let usersRef = Database.database().reference(withPath: "online")
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let savedLists = List.loadLists() {
            lists = savedLists
        }

//        navigationItem.leftBarButtonItem = editButtonItem
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as? ListsTableViewCell else {fatalError("Could not dequeue a cell")}
        
//        cell.delegate = self

        let list = lists[indexPath.row]
        cell.titleLabel?.text = list.listName
        return cell
    }

        override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            lists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            List.saveLists(lists)
        }
    }

    @IBAction func unwindToListFeeder(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as!
        ListFeederTableViewController

        if let list = sourceViewController.list {
            if let selectedIndexPath =
                tableView.indexPathForSelectedRow {
                lists[selectedIndexPath.row] = list
                tableView.reloadRows(at: [selectedIndexPath],
                                     with: .none)
            } else {
                let newIndexPath = IndexPath(row: lists.count, section: 0)
                lists.append(list)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        List.saveLists(lists)
    }
//    override func prepare(for segue: UIStoryboardSegue,
//                          sender: Any?) {
//        if segue.identifier == "showListDetails" {
//            let todoViewController = segue.destination
//                as! ListTableViewController
//            let indexPath = tableView.indexPathForSelectedRow!
//            let selectedList = lists[indexPath.row]
//            ListChangerTableViewController.list = selectedList
//        }
//    }
}

