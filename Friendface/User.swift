//
//  User.swift
//  Friendface
//
//  Created by sebastian.popa on 1/7/24.
//

import Foundation

struct User: Codable {
    let id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    let registered: Date
    var tags: [String]
    var friends: [Friend]
}
