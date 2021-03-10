//
//  UserCourses+CoreDataProperties.swift
//  WestcostEducationLab
//
//  Created by Sebastian Warvsten on 2021-03-08.
//
//

import Foundation
import CoreData


extension UserCourses {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCourses> {
        return NSFetchRequest<UserCourses>(entityName: "UserCourses")
    }

    @NSManaged public var title: String?
    @NSManaged public var subtitle: String?

}

extension UserCourses : Identifiable {

}
