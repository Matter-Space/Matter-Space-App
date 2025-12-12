//
//  UpdateExtension.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 12/12/2025.
//

import SwiftUI

extension Community{
    func refresh(){
        Task{
            do{
                updates = try await updateService.getUpdates()
                print("Updates loaded!")
            } catch {
                print("Failed to load updates")
            }
        }
    }
    
    func deleteUpdate(){
        Task {
            let id = update?.id
                do {
                    try await updateService.deleteTodo(id: id!)
                    print("🗑️ Updated deleted successfully.")
                    
                   
                    
                } catch {
                    print("❌ Failed to delete update:", error)
                }
            }
    }
}

extension AddNewsSheet{
    func save(){
        Task{
            do{
                let newUpdate = Update(category: category, title: title, description: description, createdAt: createdAt)
                let createdUpdate = try await updateService.createUpdate(newUpdate)
                print("Update successfully added!")
                showAddSheet.toggle()
            } catch {
                print("Failed to create update", error)
            }
        }
    }
}

extension EditNewsSheet{
    func save(){
        Task{
            do{
                let updatedTodo = try await updateService.createUpdate(update)
                print("✅ Todo updated successfully: \(updatedTodo)")
            } catch{
                print("Failed to update", error)
            }
        }
    }
}
