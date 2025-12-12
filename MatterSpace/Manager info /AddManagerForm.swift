//
//  AddManagerForm.swift
//  MatterSpace
//
//  Created by Boitumelo Sialumba on 11/12/2025.
//


import SwiftUI

struct Manager: Identifiable {
    var id = UUID()
    var name: String
    var role: String
    var description: String
    var linkedin: String
}

struct AddManagerForm: View {
    @AppStorage("userType") var userType: String = ""
    @State private var name = ""
    @State private var role = ""
    @State private var description = ""
    @State private var linkedin = ""
    
    @Binding var managers: [Manager]
    @Binding var managerToEdit: Manager? // New binding for editing
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGray6).ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Manager Information")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("Provide details about the manager below")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Group {
                        Text("Name").font(.headline)
                        TextField("Enter name", text: $name)
                            .padding()
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(8)
                        
                        Text("Role / Position").font(.headline)
                        TextField("Enter role", text: $role)
                            .padding()
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(8)
                        
                        Text("Description").font(.headline)
                        TextEditor(text: $description)
                            .frame(height: 150)
                            .padding()
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(8)
                        
                        Text("LinkedIn URL").font(.headline)
                        TextField("Enter LinkedIn profile URL", text: $linkedin)
                            .padding()
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        if let edit = managerToEdit,
                           let index = managers.firstIndex(where: { $0.id == edit.id }) {
                            // Edit existing manager
                            managers[index].name = name
                            managers[index].role = role
                            managers[index].description = description
                            managers[index].linkedin = linkedin
                        } else {
                            // Add new manager
                            let newManager = Manager(
                                name: name,
                                role: role,
                                description: description,
                                linkedin: linkedin
                            )
                            managers.append(newManager)
                        }
                        dismiss()
                    }) {
                        Text(managerToEdit == nil ? "Save Manager" : "Save Changes")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 5)
                    }
                    .padding(.top)
                    
                }
                .padding(25)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.05), radius: 5)
                .padding(.horizontal)
            }
        }
        .navigationTitle(managerToEdit == nil ? "Add Manager" : "Edit Manager")
        .onAppear {
            // Pre-fill fields if editing
            if let edit = managerToEdit {
                name = edit.name
                role = edit.role
                description = edit.description
                linkedin = edit.linkedin
            }
        }
    }
}

