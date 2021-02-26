//
//  UserModel.swift
//  WestcostEducationLab
//
//  Created by Sebastian Warvsten on 2021-02-26.
//

import Foundation

struct UserModel {
    var email: String
    var firstname: String
    var lastname: String
    var password: String
    var phonenumber: Int
    
    init(email: String, firstname: String, lastname: String, password: String, phonenumber: Int) {
        self.email = email
        self.firstname = firstname
        self.lastname = lastname
        self.password = password
        self.phonenumber = phonenumber
    }
    
}
