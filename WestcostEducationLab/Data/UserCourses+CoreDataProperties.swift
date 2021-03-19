//
//  UserCourses+CoreDataProperties.swift
//  WestcostEducationLab
//
//  Created by Sebastian Warvsten on 2021-03-19.
//
//

import Foundation
import CoreData


extension UserCourses {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCourses> {
        return NSFetchRequest<UserCourses>(entityName: "UserCourses")
    }

    @NSManaged public var subtitle: String?
    @NSManaged public var title: String?
    @NSManaged public var status: String?
    @NSManaged public var user: UserAccount?

}

extension UserCourses : Identifiable {

}
