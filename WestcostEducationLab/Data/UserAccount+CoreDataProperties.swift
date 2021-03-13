//
//  UserAccount+CoreDataProperties.swift
//  WestcostEducationLab
//
//  Created by Sebastian Warvsten on 2021-03-13.
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
    @NSManaged public var courses: NSSet?

}

// MARK: Generated accessors for courses
extension UserAccount {

    @objc(addCoursesObject:)
    @NSManaged public func addToCourses(_ value: UserCourses)

    @objc(removeCoursesObject:)
    @NSManaged public func removeFromCourses(_ value: UserCourses)

    @objc(addCourses:)
    @NSManaged public func addToCourses(_ values: NSSet)

    @objc(removeCourses:)
    @NSManaged public func removeFromCourses(_ values: NSSet)

}

extension UserAccount : Identifiable {

}
