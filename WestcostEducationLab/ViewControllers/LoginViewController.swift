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
    
    public static var currentUser = UserAccount()
    let context = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        validateUser()
    }
    
    func validateUser(){
        let userEmail = emailTextField.text
        let userPassword = passwordTextField.text
        
        if let userCoreData = try? context.fetch(UserAccount.fetchRequest()) as? [UserAccount]{
            if userCoreData.count > 0{
                for u in userCoreData{
                    _ = UserModel(email: u.email ?? "", firstname: u.firstname ?? "", lastname: u.lastname ?? "", password: u.password ?? "", phonenumber: Int(u.phonenumber))
                    if u.email == userEmail && u.password == userPassword{
                        LoginViewController.currentUser = u
                        print("Congratz you are in")
                        performSegue(withIdentifier: "loginSegue", sender: self)
                        return
                    }else{
                        print("Access denied!")
                    }
                }
            }else{
                print("No users registered on this device yet!")
            }
        }
    }
}
