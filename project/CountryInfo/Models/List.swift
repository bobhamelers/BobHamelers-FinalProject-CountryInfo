//
//  Lists.swift
//  CountryInfo
//
//  List struct definition, used in ListsTableViewController, ListTableViewController, ListFeederTableViewController and ListChangerTableViewController.
//  Is used to store lists or get information of lists from FireBase.
//
//  Created by Bob Hamelers on 19/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import Firebase
import Foundation

// MARK: List struct.
struct List {
    let ref: DatabaseReference?
    let listName: String
    var countryIsAlphaCode2 = [String]()
    // MARK: List properties.

    init(snapshot: DataSnapshot) {
        listName = snapshot.key
        for child in snapshot.children.allObjects as! [DataSnapshot] {
            let snapshotValue = child.childSnapshot(forPath: "name")
            countryIsAlphaCode2.append(snapshotValue.value as! String)
        }
        ref = snapshot.ref
    }
    // MARK: List Data Snapshot to get list and information in that list from FireBase.
}
