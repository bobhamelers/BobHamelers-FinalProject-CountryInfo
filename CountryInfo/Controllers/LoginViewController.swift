//
//  LoginViewController.swift
//  CountryInfo
//
//  Created by Bob Hamelers on 11/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Constants
    let loginToList = "LoginToList"
    
    // MARK: Outlets
    @IBOutlet weak var textFieldLoginUsername: UITextField!
    @IBOutlet weak var textFieldLoginPassword: UITextField!
    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
