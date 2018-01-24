//
//  Favorites.swift
//  CountryInfo
//
//  Created by Bob Hamelers on 19/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import Firebase
import Foundation

struct List {
    let ref: DatabaseReference?
    let listName: String
//    var countryIsAlphaCode2: String
    var countryIsAlphaCode2 = [String]()

    init(snapshot: DataSnapshot) {
        listName = snapshot.key
        for child in snapshot.children.allObjects as! [DataSnapshot] {
            let snapshotValue = child.childSnapshot(forPath: "name")
            countryIsAlphaCode2.append(snapshotValue.value as! String)
        }
//            countryIsAlphaCode2.append(snap as! String)
//        }

//        let snapshotValue = snapshot.value as! [Int: AnyObject]
//        countryIsAlphaCode2 = snapshotValue[0] as! String

        ref = snapshot.ref
    }
}
