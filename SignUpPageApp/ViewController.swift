//
//  ViewController.swift
//  project3
//
//  Created by Bilal Ather on 7/6/17.
//  Copyright © 2017 umsl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    let model = userData()
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var usersView: UITextView!
    @IBAction func addButton(_ sender: UIButton) {

        model.addNewUser(username: usernameField.text!, password: passwordField.text!, email: emailField.text!, phoneNumber: phoneNumberField.text!)
        usersView.text = model.publicUserInfo.joined(separator: "\n")
        usernameField.text = ""
        passwordField.text = ""
        emailField.text = ""
        phoneNumberField.text = ""
        addButtonOutlet.isEnabled = false

        
    }
    @IBOutlet weak var addButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.delegate = self
        passwordField.delegate = self
        emailField.delegate = self
        phoneNumberField.delegate = self

    }
    func sendAlert (message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(ok)

        if let presented = self.presentedViewController {
            presented.removeFromParentViewController()
        }
        
        if presentedViewController == nil {
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        validateInputs(textField: textField)
        if model.allInputsValid() {
            addButtonOutlet.isEnabled = true
        } else {
            addButtonOutlet.isEnabled = false

        }
        return true
    }

    func validateInputs(textField: UITextField){
        if textField == usernameField {
            let validUsername = model.isValidUserName(username: usernameField.text!)
            if validUsername.characters.count > 0{
                sendAlert(message: validUsername)
            }
        }
        if textField == passwordField {
            let validPassword = model.isValidPassword(password: passwordField.text!)
            if validPassword.characters.count > 0{
                sendAlert(message: validPassword)
            }
        }
        if textField == emailField {
            let validEmail = model.isValidEmail(email: emailField.text!)
            if validEmail.characters.count > 0{
                sendAlert(message: validEmail)
            }
        }
        if textField == phoneNumberField {
            let validPhoneNumber = model.isValidPhoneNumber(phoneNumber: phoneNumberField.text!)
            if validPhoneNumber.characters.count > 0{
                sendAlert(message: validPhoneNumber)
            }
            }
        }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneNumberField {
            let allowedChars = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            return allowedChars.isSuperset(of: characterSet)
        } else {
            return true
        }

    }
    }
