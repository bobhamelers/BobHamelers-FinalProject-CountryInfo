//
//  CreateAlert.swift
//  CountryInfo
//
//  Here you can find an extension for an alert, used in LoginViewController, SignUpViewController and ListFeederTableViewController.
//
//  Created by Bob Hamelers on 01/02/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import UIKit

extension UIViewController {
    /// Create alert function that displays a popup.
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        // Alert function with title (Okay) and message for different alerts.
    }
}
