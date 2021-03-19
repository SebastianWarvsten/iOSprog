//
//  StatusEnumeration.swift
//  WestcostEducationLab
//
//  Created by Sebastian Warvsten on 2021-03-19.
//

import Foundation

enum StatusEnumeration{
    case NoStatus
    case Wishlist
    case Bought
    case Register
    case Compleated
    case Intrested
}

protocol StatusProtocol {
    var title: String { get set }
    var subtitle: String { get set }
    var status: StatusEnumeration { get set }
}
