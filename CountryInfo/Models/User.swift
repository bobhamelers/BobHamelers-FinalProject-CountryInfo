//
//  User.swift
//  CountryInfo
//
//  Created by Bob Hamelers on 11/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import Foundation
import FirebaseAuth

// MARK: User struct for FireBase
struct User {
    
    let uid: String
    let email: String
    
    init(authData: User) {
        uid = authData.uid
        email = authData.email
    }
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
}
