//
//  GraduateExtension.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 12/12/2025.
//

import SwiftUI
import Foundation

extension GraduatePage{
    func refresh(){
        Task{
            do{
                graduates = try await graduateService.getGraduates()
                print("Graduates Loaded successfully!!")
            } catch{
                print("Failed to load graduates", error)
            }
        }
    }
}

extension AddGraduate{
    func save(){
        Task{
            do{
                let newGraduate = Graduate(name: name, academicInfo: academicInfo)
                let createdGraduate = try await graduateService.createGraduate(newGraduate)
                print("Graduate added successfully!!")
                added.toggle()
            } catch {
                print("Failed to add graduate", error)
            }
        }
    }
}
