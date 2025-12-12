//
//  StudentExtension.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 12/12/2025.
//

import Foundation
import SwiftUI

extension StudentPage{
    func refresh(){
        Task{
            do{
                students = try await studentService.getStudents()
                
                print("✅Students refreshed successfully!")
        
            } catch {
                errorMessage = error.localizedDescription
                print("❌ Error fetching students:", error)
            }
        }
    }
}

extension AddStudent{
    func Save(){
        Task{
            do{
                let newStudent = StudentModel(name: name, academicInfo: academicInfo)
                
                let createdStudent = try await studentService.createStudent(newStudent)
                print("Student successfully created!!")
                added.toggle()
            } catch{
                print("Error creating students:", error)
            }
        }
    }
}
