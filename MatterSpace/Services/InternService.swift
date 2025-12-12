//
//  InternService.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 12/12/2025.
//

import Foundation
import SwiftUI

class InternService{
    @AppStorage("token") var token:String = ""
    private let baseURL = URL(string: "http://localhost:3002")!
    
    func createIntern(_ intern: Intern) async throws -> Intern {
        print("The token is: " + token)
        let url = baseURL.appendingPathComponent("/interns/add")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = try JSONEncoder().encode(intern)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        print("🔵 RAW RESPONSE:")
        print(String(data: data, encoding: .utf8) ?? "No readable data")
        
        return try JSONDecoder().decode(Intern.self, from: data)
    }
    
   
    
    func getInterns() async throws -> [Intern] {
        let url = baseURL.appendingPathComponent("interns")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        print("🔵 RAW RESPONSE:")
        print(String(data: data, encoding: .utf8) ?? "No readable response")

        return try JSONDecoder().decode([Intern].self, from: data)
    }
}

    

