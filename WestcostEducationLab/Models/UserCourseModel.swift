//
//  CourseItem.swift
//  WestcostEducationLab
//
//  Created by Sebastian Warvsten on 2021-03-01.
//

import Foundation
import UIKit

class UserCourseModel: StatusProtocol {
    var title: String
    var subtitle: String
    var status: StatusEnumeration
    
    init(title: String, label: String, status: StatusEnumeration) {
        self.title = title
        self.subtitle = label
        self.status = status
    }
}
