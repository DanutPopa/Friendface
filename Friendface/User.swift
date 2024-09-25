//
//  User.swift
//  Friendface
//
//  Created by Danut Popa on 25.09.2024.
//

import Foundation


struct User: Codable {
    let id: String
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
}

struct Friend: Codable {
    let id: String
    let name: String
}
