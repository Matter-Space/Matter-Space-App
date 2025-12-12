//
//  UpdateService.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 12/12/2025.
//
import Foundation
import SwiftUI

class UpdateService{
    @AppStorage("token") var token:String = ""
    private let baseURL = URL(string: "http://localhost:3002")!
    
    func createUpdate(_ update: Update) async throws -> Update {
        print("The token is: " + token)
        let url = baseURL.appendingPathComponent("/updates/add")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = try JSONEncoder().encode(update)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        print("🔵 RAW RESPONSE:")
        print(String(data: data, encoding: .utf8) ?? "No readable data")
        
        return try JSONDecoder().decode(Update.self, from: data)
    }
    
   
    
    func getUpdates() async throws -> [Update] {
        let url = baseURL.appendingPathComponent("updates")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        print("🔵 RAW RESPONSE:")
        print(String(data: data, encoding: .utf8) ?? "No readable response")

        return try JSONDecoder().decode([Update].self, from: data)
    }
    
    func updateNews(_ update: Update) async throws -> Update {
        guard let id = update.id else { throw URLError(.badURL) }
        let url = baseURL.appendingPathComponent("/updates/\(id)")
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(update)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(Update.self, from: data)
    }
    
    // Delete a todo
    func deleteTodo(id: String) async throws {
        let url = baseURL.appendingPathComponent("/updates/\(id)")
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        _ = try await URLSession.shared.data(for: request)
    }
}

    

