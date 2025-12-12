//
//  InternExtension.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 12/12/2025.
//

import SwiftUI
import Foundation

extension InternPage{
    func refresh(){
        Task{
            do{
                interns = try await internService.getInterns()
                print("Interns loaded successfully")
            } catch {
                print("Failed to load interns", error)
            }
        }
    }
}

extension AddIntern{
    func Save(){
        Task{
            do{
                let newIntern = Intern(name: name, academicInfo: academicInfo)
                let createdIntern = try await internService.createIntern(newIntern)
                print("Intern successfully created!" )
                added.toggle()
            } catch {
                print("Failes to created intern", error)
            }
        }
    }
}
