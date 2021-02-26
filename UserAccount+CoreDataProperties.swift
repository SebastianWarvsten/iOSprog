//
//  UserAccount+CoreDataProperties.swift
//  WestcostEducationLab
//
//  Created by Sebastian Warvsten on 2021-02-26.
//
//

import Foundation
import CoreData


extension UserAccount {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserAccount> {
        return NSFetchRequest<UserAccount>(entityName: "UserAccount")
    }

    @NSManaged public var email: String?
    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?
    @NSManaged public var password: String?
    @NSManaged public var phonenumber: Int32

}

extension UserAccount : Identifiable {

}
