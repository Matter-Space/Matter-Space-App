//
//  AddProManagerForm.swift
//  MatterSpace
//
//  Created by Boitumelo Sialumba on 11/12/2025.
//


import SwiftUI

// Model
struct ProjectManagerInfo: Identifiable {
    var id: UUID = UUID()
    var name: String
    var role: String
    var description: String
    var linkedin: String
}

// Sheet Form
struct AddProManagerForm: View {
    @AppStorage("userType") var userType: String = ""
    @State private var name = ""
    @State private var role = ""
    @State private var description = ""
    @State private var linkedin = ""
    
    @Binding var projectManagers: [ProjectManagerInfo] // Bind to parent array
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Project Manager Information")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Text("Provide details about the manager below")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Group {
                        Text("Name")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        TextField("Enter name", text: $name)
                            .padding()
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(8)
                        
                        Text("Role / Position")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        TextField("Enter role", text: $role)
                            .padding()
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(8)
                        
                        Text("Description")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        TextEditor(text: $description)
                            .frame(height: 150)
                            .padding()
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(8)
                        
                        Text("LinkedIn URL")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        TextField("Enter LinkedIn profile URL", text: $linkedin)
                            .padding()
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        let newPM = ProjectManagerInfo(
                            name: name,
                            role: role,
                            description: description,
                            linkedin: linkedin
                        )
                        projectManagers.append(newPM)
                        dismiss()
                    }) {
                        Text("Save Project Manager")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    }
                    .padding(.top)
                    
                }
                .padding(25)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                .padding(.horizontal)
            }
        }
        .navigationTitle("Add Project Manager")
    }
}

// Parent View showing list and button
struct Managerss: View {
    @State private var projectManagers: [ProjectManagerInfo] = []
    @State private var showAddManagerSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(projectManagers) { manager in
                    VStack(alignment: .leading) {
                        Text(manager.name)
                            .font(.headline)
                        Text(manager.role)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle(" Project Managers")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddManagerSheet = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddManagerSheet) {
                AddProManagerForm(projectManagers: $projectManagers)
            }
        }
    }
}

// Preview
struct Managers_Previews: PreviewProvider {
    static var previews: some View {
       ProjectManagers()
    }
}

