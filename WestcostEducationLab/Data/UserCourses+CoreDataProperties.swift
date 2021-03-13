//
//  UserCourses+CoreDataProperties.swift
//  WestcostEducationLab
//
//  Created by Sebastian Warvsten on 2021-03-13.
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
    @NSManaged public var user: UserAccount?

}

extension UserCourses : Identifiable {

}
