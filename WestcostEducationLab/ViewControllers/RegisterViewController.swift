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
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var repeatPasswordTextfield: UITextField!
    
    let context = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func exitButton(_ sender: UIButton) {
            self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        let firstName = firstNameTextfield.text
        let lastName = lastNameTextfield.text
        let email = emailTextField.text
        let phoneNumber = Int(phoneNumberTextField.text!)
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
        
        let newUser = UserModel(email: email!, firstname: firstName!, lastname: lastName!, password: password!, phonenumber: phoneNumber!)
        save(user: [newUser])
        
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
    
    func save(user: [UserModel]){
        for u in user{
            let userAccount = UserAccount(context: context)
            userAccount.email = u.email
            userAccount.firstname = u.firstname
            userAccount.lastname = u.lastname
            userAccount.password = u.password
            userAccount.phonenumber = Int32(u.phonenumber)
        }

        do{
            try context.save()
            print("New user saved in coreData")
        } catch {
            print("Unable to save!")
        }
    }
}
