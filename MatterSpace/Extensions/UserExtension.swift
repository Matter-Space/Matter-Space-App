//
//  UserExtension.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 11/12/2025.
//

import SwiftUI
import Foundation

extension Signup{
    func Signup(){
        Task{
            do{
                let newUser = SignupRequest(username: userName, email: email, userType: userType, password: password)
                
                let createdUser = try await service.createUser(newUser)
                token = createdUser.token
                print("✅ User created successfully: \(createdUser)")
                isSignup.toggle()
            } catch {
                print("❌ Failed to create user:", error)
                return
            }
        }
    }
}

extension Login{
    func Login(){
        Task{
            do{
                let loginResponse = try await service.loginUser(LoginRequest(email: email, password: password))
                token = loginResponse.token
                userType = loginResponse.userType
                isLogging.toggle()
                print("✅ Login successful")
                print("Token:", token)
                print("UserType:", userType)
            } catch {
                errorMessage = error.localizedDescription
                print("❌ Error login:", error)
                return
            }
        }
    }
}
