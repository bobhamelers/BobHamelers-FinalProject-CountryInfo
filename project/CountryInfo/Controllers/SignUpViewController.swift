//
//  SignUpViewController.swift
//  CountryInfo
//
//  This Controller takes care of the signup of an user.
//  With email and password (and repeat password) an user can signup when the user tapped the signup button.
//  Next to that, an user can click on cancel.
//
//  Created by Bob Hamelers on 11/01/2018.
//  Copyright © 2018 Bob Hamelers. All rights reserved.
//

import FirebaseAuth
import FirebaseDatabase
import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: Properties.
    let signUpSeague = "SignUpSeague"
    var ref: DatabaseReference!
    
    // MARK: Outlets.
    @IBOutlet weak var textFieldSignUpEmail: UITextField!
    @IBOutlet weak var textFieldSignUpPassword: UITextField!
    @IBOutlet weak var textFieldRepeatPassword: UITextField!

    // MARK: Actions.
    @IBAction func signUpAndLogin(_ sender: AnyObject) {
        
        if textFieldSignUpEmail.text!.contains("@") == false {
            self.createAlert(title: "FAILURE", message: "You insert an invalid e-mail.")
            // MARK: A check for false e-mailadresses.
            return
        }
        
        if textFieldSignUpPassword.text! != textFieldRepeatPassword.text! {
            self.createAlert(title: "FAILURE", message: "Your password and repeat password are not the same.")
            // MARK: A check for not-known and fake passwords.
            return
        }
        
        if textFieldSignUpPassword.text!.count < 6 {
            self.createAlert(title: "FAILURE", message: "Your password has to be 6 characters or longer.")
            // MARK: A check that a password has to be longer then 6 characters.
            return
        }
        
        Auth.auth().createUser(withEmail: textFieldSignUpEmail.text!,
                               password: textFieldSignUpPassword.text!) { user, error in
                                if error == nil {
                                    Auth.auth().signIn(withEmail: self.textFieldSignUpEmail.text!,
                                                       password: self.textFieldSignUpPassword.text!)
                                }
                                else {
                                    self.createAlert(title: "FAILURE", message: "This e-mail is already used by a user")
                                    // MARK: A check for already know e-mail.
                                    return
                                }
        }
        // MARK: SignUp authentication with e-mail and password.
    }
    
    /// MARK: Function, dismiss keyboard.
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        textFieldSignUpEmail.resignFirstResponder()
        textFieldSignUpPassword.resignFirstResponder()
        textFieldRepeatPassword.resignFirstResponder()
    }
    
    /// MARK: ViewDidLoad standard.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        // MARK: Database reference.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        // MARK: Recognizer for DismissKeyboard.
        
        Auth.auth().addStateDidChangeListener() { auth, user in
            if user != nil {
                self.performSegue(withIdentifier: self.signUpSeague, sender: nil)
            }
        }
        // MARK: Recognizer for user authentication.
    }
    
    /// MARK: Create alert function that displays a popup.
    func createAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        // MARK: Alert function with title (Okay) and message for different alerts.
    }

    /// MARK: Function that handles memory warnings.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // MARK: Dispose of any resources that can be recreated.
    }
}
