//
//  UserService.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 11/12/2025.
//

import Foundation
import SwiftUI

class UserService{
    private let baseURL = URL(string: "http://localhost:3002")! //api url
    
    func createUser(_ registrationDetails: SignupRequest) async throws -> SignupResponse {
        let url = baseURL.appendingPathComponent("/user/signup")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(registrationDetails)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(SignupResponse.self, from: data)
    }
    
    func loginUser(_ loginDetails: LoginRequest) async throws -> LoginResponse {
        let url = baseURL.appendingPathComponent("/user/login")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(loginDetails)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(LoginResponse.self, from: data)
    }
    
}
