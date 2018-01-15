//
//  SignUpViewController.swift
//  CountryInfo
//
//  Created by Bob Hamelers on 11/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import FirebaseAuth
import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: Constants
    let signUpSeague = "SignUpSeague"
    let charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_"
    
    // MARK: Outlets
    @IBOutlet weak var textFieldSignUpEmail: UITextField!
    @IBOutlet weak var textFieldSignUpUsername: UITextField!
    @IBOutlet weak var textFieldSignUpPassword: UITextField!
    @IBOutlet weak var textFieldRepeatPassword: UITextField!
    // MARK: Actions

    @IBAction func signUpAndLogin(_ sender: AnyObject) {
        
        if textFieldSignUpEmail.text!.contains("@") == false {
            self.createAlert(title: "FAILURE", message: "You insert an invalid e-mail.")}
//        if charset.contains(textFieldSignUpUsername.text!) ==
//
//        textFieldSignUpUsername.text!.cointains(charactersIn: ACCEPTABLE_CHARACTERS)
        
        if textFieldSignUpPassword.text! != textFieldRepeatPassword.text! {
            self.createAlert(title: "FAILURE", message: "Your password and repeat password are not the same.")}
        
        if textFieldSignUpPassword.text!.count < 6 {
            self.createAlert(title: "FAILURE", message: "Your password has to be 6 characters or longer.")}
        Auth.auth().createUser(withEmail: textFieldSignUpEmail.text!,
                               password: textFieldSignUpPassword.text!) { user, error in
                                if error == nil {
                                    Auth.auth().signIn(withEmail: self.textFieldSignUpEmail.text!,
                                                       password: self.textFieldSignUpPassword.text!)
                                }
        }
        // SignUp Authentication
    }
    
    // MARK: Function, DismissKeyboard
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        textFieldSignUpEmail.resignFirstResponder()
        textFieldSignUpUsername.resignFirstResponder()
        textFieldSignUpPassword.resignFirstResponder()
        textFieldRepeatPassword.resignFirstResponder()
    }
    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        Auth.auth().addStateDidChangeListener() { auth, user in
            if user != nil {
                self.performSegue(withIdentifier: self.signUpSeague, sender: nil)
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
