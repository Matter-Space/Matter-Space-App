//
//  Users.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 11/12/2025.
//

import Foundation

struct User: Codable, Identifiable{
    var id: String?
    var username:String
    var email:String
    var userType: String
    var password:String
}

struct SignupRequest: Codable{
    var username:String
    var email:String
    var userType: String
    var password:String
}

struct SignupResponse: Codable{
    var message: String?
    var user: User
    var token:String
}

struct LoginRequest: Codable{
    var email: String
    var password: String
}

struct LoginResponse: Codable{
    var message: String?
    var token: String
    var userType: String
}
