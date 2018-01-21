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
    let key: String
    let addedByUser: String
    let ref: DatabaseReference?
    let listName: String
    var countryName: [String]
    var countryIsAlphaCode2: [String]

    init(key: String = "", addedByUser: String, listName: String, countryName: [String], countryIsAlphaCode2: [String]) {
        self.key = key
        self.addedByUser = addedByUser
        self.ref = nil
        self.listName = listName
        self.countryName = countryName
        self.countryIsAlphaCode2 = countryIsAlphaCode2
    }

    init(snapshot: DataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        addedByUser = snapshotValue["addedByUser"] as! String
        ref = snapshot.ref
        listName = snapshotValue["listName"] as! String
        countryName = snapshotValue["countryName"] as! [String]
        countryIsAlphaCode2 = snapshotValue["countryIsAlphaCode2"] as! [String]
    }
    func toAnyList() -> Any {
        return [
            "addedByUser": addedByUser,
            "listName": listName,
            "countryName": countryName,
            "countryIsAlphaCode2": countryIsAlphaCode2
        ]
    }
    
    static func loadLists() -> [List]?  {
        guard let codedToDos = try? Data(contentsOf: ArchiveURL)
            else {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<List>.self,
                                               from: codedToDos)
    }
    
    static func saveLists(_ todos: [List]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(todos)
        try? codedToDos?.write(to: ArchiveURL,
                               options: .noFileProtection)
        
    }
    
    static let DocumentsDirectory =
        FileManager.default.urls(for: .documentDirectory,
                                 in: .userDomainMask).first!
    static let ArchiveURL =
        DocumentsDirectory.appendingPathComponent("lists")
            .appendingPathExtension("plist")
}
