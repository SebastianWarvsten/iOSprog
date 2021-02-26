//
//  LoginViewController.swift
//  WestcostEducationLab
//
//  Created by Sebastian Warvsten on 2021-02-26.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let context = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
    var user = UserModel(email: "", firstname: "", lastname: "", password: "", phonenumber: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        let userEmail = emailTextField.text
        let userPassword = passwordTextField.text
        
        loadUser()
        
        if userEmail == user.email && userPassword == user.password {
            print("Du är nu inloggad")
        } else {
            print("Det fungerade inte att logga in")
        }
        //läsa sparade email och password
//        let userEmailStored = hämta från core data
//        let userPasswordStored = hämta från core data
//
//        if userEmailStored == userEmal && userPasswordStored = userPassword {
//
//        }
    }
    func loadUser(){
        
        if let userFromCoreData = try? context.fetch(UserAccount.fetchRequest()) as? [UserAccount]{
            for u in userFromCoreData{
                user = UserModel(email: u.email ?? "", firstname: u.firstname ?? "", lastname: u.lastname ?? "", password: u.password ?? "", phonenumber: Int(u.phonenumber))
            }
        }
    }
}
