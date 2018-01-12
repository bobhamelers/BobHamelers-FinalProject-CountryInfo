//
//  LoginViewController.swift
//  CountryInfo
//
//  Created by Bob Hamelers on 11/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import FirebaseAuth
import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Constants
    let loginSeague = "LoginSeague"
    
    // MARK: Outlets
    @IBOutlet weak var textFieldLoginEmail: UITextField!
    @IBOutlet weak var textFieldLoginPassword: UITextField!
    @IBOutlet weak var GifView: UIImageView!

    // MARK: Actions
    
    @IBAction func loginDidTouch(_ sender: AnyObject) {
        Auth.auth().signIn(withEmail: textFieldLoginEmail.text!,
                           password: textFieldLoginPassword.text!, completion: { (user, error) in if(error != nil){
                            self.createAlert(title: "FAILURE", message: "Your E-mail, Password or both are incorrect or not known")
                            }})
        // Login Authentication
    }
    
    // MARK: Function, DismissKeyboard
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        textFieldLoginEmail.resignFirstResponder()
        textFieldLoginPassword.resignFirstResponder()
    }
    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        GifView.loadGif(name: "world")
        // Load Loginview
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        Auth.auth().addStateDidChangeListener() { auth, user in
            if user != nil {
                self.performSegue(withIdentifier: self.loginSeague, sender: nil)
            }
        }
        // Recognizer for DismissKeyboard and User Authentication
    }
    
    func createAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        // Alert function for different alerts in SignUp and Login
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender:
//        Any?) {
//        if segue.identifier == "SignUpSegue" {
//            let signUpViewController = segue.destination as!
//            SignUpViewController
//        }
//        // Prepare for SignUpViewController
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldLoginEmail {
            textFieldLoginPassword.becomeFirstResponder()
        }
        if textField == textFieldLoginPassword {
            textField.resignFirstResponder()
        }
        return true
    }
    // Return function in extension to return information in textfields
}
