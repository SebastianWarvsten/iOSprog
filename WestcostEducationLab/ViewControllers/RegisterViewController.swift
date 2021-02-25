//
//  RegisterViewController.swift
//  WestcostEducationLab
//
//  Created by Sebastian Warvsten on 2021-02-25.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var repeatPasswordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    @IBAction func registerButton(_ sender: UIButton) {
        let firstName = firstNameTextfield.text
        let lastName = lastNameTextfield.text
        let email = emailTextField.text
        let password = passwordTextfield.text
        let repeatPassword = repeatPasswordTextfield.text
        
        if firstName!.isEmpty || lastName!.isEmpty || email!.isEmpty || password!.isEmpty || repeatPassword!.isEmpty{
            displayAlertMessage(message: "All fields need to be filled in")
            return
        }
        if password != repeatPassword {
            displayAlertMessage(message: "The passwords do not match")
            return
        }
        
        //Store data in core data
        
        //save info in core data and dismiss the popover
        //...also show message that the account has been created
        let myAlert = UIAlertController(title: "Congratulations", message: "Registration successfull!", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){ action in
            self.dismiss(animated: true, completion: nil)
        }
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    func displayAlertMessage(message: String) {
        let myAlert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
}
