//
//  GraduateService.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 12/12/2025.
//

//
//  InternService.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 12/12/2025.
//

import Foundation
import SwiftUI

class GraduateService{
    @AppStorage("token") var token:String = ""
    private let baseURL = URL(string: "http://localhost:3002")!
    
    func createGraduate(_ graduate: Graduate) async throws -> Graduate {
        print("The token is: " + token)
        let url = baseURL.appendingPathComponent("/graduates/add")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = try JSONEncoder().encode(graduate)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        print("🔵 RAW RESPONSE:")
        print(String(data: data, encoding: .utf8) ?? "No readable data")
        
        return try JSONDecoder().decode(Graduate.self, from: data)
    }
    
   
    
    func getGraduates() async throws -> [Graduate] {
        let url = baseURL.appendingPathComponent("graduates")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        print("🔵 RAW RESPONSE:")
        print(String(data: data, encoding: .utf8) ?? "No readable response")

        return try JSONDecoder().decode([Graduate].self, from: data)
    }
}

    

