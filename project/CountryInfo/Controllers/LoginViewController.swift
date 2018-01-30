//
//  LoginViewController.swift
//  CountryInfo
//
//  This Controller takes care of the login of an user.
//  It displays a GIF File.
//  With email and password an user can login when the user tapped the login button.
//  Next to that, an user can signup if an user tapped the signup button.
//
//  Created by Bob Hamelers on 11/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import FirebaseAuth
import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Properties.
    let loginSeague = "LoginSeague"
    
    // MARK: Outlets.
    @IBOutlet weak var textFieldLoginEmail: UITextField!
    @IBOutlet weak var textFieldLoginPassword: UITextField!
    @IBOutlet weak var GifView: UIImageView!

    // MARK: Actions.
    
    @IBAction func loginDidTouch(_ sender: AnyObject) {
        Auth.auth().signIn(withEmail: textFieldLoginEmail.text!,
                           password: textFieldLoginPassword.text!, completion: { (user, error) in if(error != nil){
                            self.createAlert(title: "FAILURE", message: "Your E-mail, Password or both are incorrect or not known")
                            }})
        // Login authentication when e-mail and password a correct and filled in.
    }
    
    /// Function, dismiss keyboard.
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        textFieldLoginEmail.resignFirstResponder()
        textFieldLoginPassword.resignFirstResponder()
    }
    
    /// ViewDidLoad standard.
    override func viewDidLoad() {
        super.viewDidLoad()
        GifView.loadGif(name: "world")
        // Load GIF file.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        // Recognizer for DismissKeyboard.
        
        Auth.auth().addStateDidChangeListener() { auth, user in
            if user != nil {
                self.performSegue(withIdentifier: self.loginSeague, sender: nil)
            }
        }
        // Recognizer for user authentication.
    }
    
    /// Create alert function that displays a popup.
    func createAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        // Alert function with title (Okay) and message for different alerts.
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    /// Return textfields.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldLoginEmail {
            textFieldLoginPassword.becomeFirstResponder()
        }
        if textField == textFieldLoginPassword {
            textField.resignFirstResponder()
        }
        return true
    }
    // Return function in extension to return information in textfields.
}
