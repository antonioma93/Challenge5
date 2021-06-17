//
//  User.swift
//  Challenge5
//
//  Created by Massa Antonio on 17/06/21.
//

import Foundation
import SwiftUI

struct User: Codable, Identifiable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var friends: [Friend]
    
    var checkIsActive: String {
        return self.isActive ? "🟢" : "🔴"
    }
}

struct Friend: Codable, Identifiable {
    
    var id: String
    var name: String
}
