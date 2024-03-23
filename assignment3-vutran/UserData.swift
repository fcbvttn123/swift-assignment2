//
//  UserData.swift
//  assignment3-vutran
//
//  Created by Default User on 3/20/24.
//

import UIKit

class UserData: NSObject {
    var id: Int?
    var name: String?
    var email: String?
    var address: String?
    var phone: String?
    var age: String?
    var gender: String?
    var birthday: String?
    var avatar: String?
    
    init(id: Int? = nil, name: String? = nil, email: String? = nil, address: String? = nil, phone: String? = nil, age: String? = nil, gender: String? = nil, birthday: String? = nil, avatar: String? = nil) {
        self.id = id
        self.name = name
        self.email = email
        self.address = address
        self.phone = phone
        self.age = age
        self.gender = gender
        self.birthday = birthday
        self.avatar = avatar
    }
    
    func printUserData() {
        print("")
        print("---------------------------------------")
        print("User Data:")
        print("ID: \(id ?? -1)")
        print("Name: \(name ?? "N/A")")
        print("Email: \(email ?? "N/A")")
        print("Address: \(address ?? "N/A")")
        print("Phone: \(phone ?? "N/A")")
        print("Age: \(age)")
        print("Gender: \(gender ?? "N/A")")
        print("Birthday: \(birthday ?? "N/A")")
        print("Avatar: \(avatar ?? "N/A")")
        print(" ")
        print("---------------------------------------")
    }
    
}
