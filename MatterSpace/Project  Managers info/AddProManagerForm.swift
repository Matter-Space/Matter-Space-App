//
//  AddProManagerForm.swift
//  MatterSpace
//
//  Created by Boitumelo Sialumba on 11/12/2025.
//



//import SwiftUI
//
//// Define the ProjectManagerInfo structure
//struct ProjectManagerInfo: Identifiable {
//    var id: UUID = UUID()
//    var name: String
//    var role: String
//    var description: String
//    var linkedin: String
//}
//
//// AddProjectManagerForm for adding/editing a manager
//struct AddProManagerForm: View {
//    @AppStorage("userType") var userType: String = ""
//    @State private var name = ""
//    @State private var role = ""
//    @State private var description = ""
//    @State private var linkedin = ""
//    
//    @Binding var projectManagers: [ProjectManagerInfo]
//    @Binding var managerToEdit: ProjectManagerInfo?
//    @Environment(\.dismiss) var dismiss
//    @State private var showAddManagerSheet = false
//    var body: some View {
//        ZStack {
//            Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all)
//            
//            ScrollView {
//                VStack(alignment: .leading, spacing: 20) {
//                    VStack(alignment: .leading, spacing: 5) {
//                        Text("Project Manager Information")
//                            .font(.title)
//                            .fontWeight(.semibold)
//                            .foregroundColor(.black)
//                        
//                        Text("Provide details about the manager below")
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                    }
//                    
//                    Group {
//                        Text("Name").font(.headline).foregroundColor(.black)
//                        TextField("Enter name", text: $name)
//                            .padding()
//                            .background(Color(UIColor.systemGray5))
//                            .cornerRadius(8)
//                        
//                        Text("Role / Position").font(.headline).foregroundColor(.black)
//                        TextField("Enter role", text: $role)
//                            .padding()
//                            .background(Color(UIColor.systemGray5))
//                            .cornerRadius(8)
//                        
//                        Text("Description").font(.headline).foregroundColor(.black)
//                        TextEditor(text: $description)
//                            .frame(height: 150)
//                            .padding()
//                            .background(Color(UIColor.systemGray5))
//                            .cornerRadius(8)
//                        
//                        Text("LinkedIn URL").font(.headline).foregroundColor(.black)
//                        TextField("Enter LinkedIn profile URL", text: $linkedin)
//                            .padding()
//                            .background(Color(UIColor.systemGray5))
//                            .cornerRadius(8)
//                    }
//                    
//                    Button(action: {
//                        if let edit = managerToEdit,
//                           let index = projectManagers.firstIndex(where: { $0.id == edit.id }) {
//                            // Edit existing manager
//                            projectManagers[index].name = name
//                            projectManagers[index].role = role
//                            projectManagers[index].description = description
//                            projectManagers[index].linkedin = linkedin
//                        } else {
//                            // Add new manager
//                            let newPM = ProjectManagerInfo(
//                                name: name,
//                                role: role,
//                                description: description,
//                                linkedin: linkedin
//                            )
//                            projectManagers.append(newPM)
//                        }
//                        dismiss()
//                    }) {
//                        Text(managerToEdit == nil ? "Save Project Manager" : "Save Changes")
//                            .foregroundColor(.white)
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.orange)
//                            .cornerRadius(10)
//                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
//                    }
//                    .padding(.top)
//                    
//                }
//                .padding(25)
//                .background(Color.white)
//                .cornerRadius(10)
//                .shadow(color: Color.black.opacity(0.05), radius: 5)
//                .padding(.horizontal)
//            }
//        }
//        
//        .navigationTitle(managerToEdit == nil ? "Add Project Manager" : "Edit Project Manager")
//        .onAppear {
//            if let edit = managerToEdit {
//                name = edit.name
//                role = edit.role
//                description = edit.description
//                linkedin = edit.linkedin
//            }
//        }
//        
//    }
//}
//
//// Managerss view: Displays the list of project managers
//struct Managerss: View {
//    @State private var projectManagers: [ProjectManagerInfo] = [
//        ProjectManagerInfo(name: "Tsitsi", role: "Lead", description: "Great manager", linkedin: "https://linkedin.com"),
//        ProjectManagerInfo(name: "Boity", role: "Assistant", description: "Helps everywhere", linkedin: "https://linkedin.com")
//    ]
//    @State private var showAddManagerSheet = false
//    @State private var managerToEdit: ProjectManagerInfo? = nil
//    @State private var editMode: EditMode = .inactive
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                List {
//                    ForEach(projectManagers) { manager in
//                        NavigationLink(destination: ProjectManagerDetailView(pm: manager)) {
//                            HStack {
//                                VStack(alignment: .leading) {
//                                    Text(manager.name)
//                                        .font(.headline)
//                                }
//                                Spacer()
//                                
//                                
//                                if editMode == .active {
//                                    Button(action: {
//                                        managerToEdit = manager
//                                        showAddManagerSheet = true
//                                    }) {
//                                        Image(systemName: "pencil")
//                                            .foregroundColor(.blue)
//                                    }
//                                    .buttonStyle(BorderlessButtonStyle())
//                                }
//                            }
//                        }
//                    }
//                    .onDelete { offsets in
//                        projectManagers.remove(atOffsets: offsets)
//                    }
//                }
//                .navigationTitle("Project Managers")
//                .environment(\.editMode, $editMode)  // Bind the editMode to the environment
//                .sheet(isPresented: $showAddManagerSheet) {
//                    AddProManagerForm(
//                        projectManagers: $projectManagers,
//                        managerToEdit: $managerToEdit
//                    )
//                }
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button(action: {
//                        managerToEdit = nil // No manager to edit means adding a new one
//                        showAddManagerSheet = true
//                    }) {
//                        Image(systemName: "plus")
//                            .font(.title)  // Adjust the size if needed
//                    }
//                    
//                }
//            }
//        }
//    }
//}
//
//
//
//
//
//
//// Preview
//struct Managers_Previews: PreviewProvider {
//    static var previews: some View {
//        Managerss()
//    }
//}
//
import SwiftUI

// Define the ProjectManagerInfo structure
struct ProjectManagerInfo: Identifiable {
    var id: UUID = UUID()
    var name: String
    var role: String
    var description: String
    var linkedin: String
}

// AddProjectManagerForm for adding/editing a manager
struct AddProManagerForm: View {
    @AppStorage("userType") var userType: String = ""
    @State private var name = ""
    @State private var role = ""
    @State private var description = ""
    @State private var linkedin = ""
    
    @Binding var projectManagers: [ProjectManagerInfo]
    @Binding var managerToEdit: ProjectManagerInfo?
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
                        Text("Name").font(.headline).foregroundColor(.black)
                        TextField("Enter name", text: $name)
                            .padding()
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(8)
                        
                        Text("Role / Position").font(.headline).foregroundColor(.black)
                        TextField("Enter role", text: $role)
                            .padding()
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(8)
                        
                        Text("Description").font(.headline).foregroundColor(.black)
                        TextEditor(text: $description)
                            .frame(height: 150)
                            .padding()
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(8)
                        
                        Text("LinkedIn URL").font(.headline).foregroundColor(.black)
                        TextField("Enter LinkedIn profile URL", text: $linkedin)
                            .padding()
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        if let edit = managerToEdit,
                           let index = projectManagers.firstIndex(where: { $0.id == edit.id }) {
                            // Edit existing manager
                            projectManagers[index].name = name
                            projectManagers[index].role = role
                            projectManagers[index].description = description
                            projectManagers[index].linkedin = linkedin
                        } else {
                            // Add new manager
                            let newPM = ProjectManagerInfo(
                                name: name,
                                role: role,
                                description: description,
                                linkedin: linkedin
                            )
                            projectManagers.append(newPM)
                        }
                        dismiss()
                    }) {
                        Text(managerToEdit == nil ? "Save Project Manager" : "Save Changes")
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
                .shadow(color: Color.black.opacity(0.05), radius: 5)
                .padding(.horizontal)
            }
        }
        .navigationTitle(managerToEdit == nil ? "Add Project Manager" : "Edit Project Manager")
        .onAppear {
            if let edit = managerToEdit {
                name = edit.name
                role = edit.role
                description = edit.description
                linkedin = edit.linkedin
            }
        }
    }
}

// Managers view: Displays the list of project managers
struct Managerss: View {
    @State private var projectManagers: [ProjectManagerInfo] = [
        ProjectManagerInfo(name: "Tsitsi", role: "Lead", description: "Great manager", linkedin: "https://linkedin.com"),
        ProjectManagerInfo(name: "Boity", role: "Assistant", description: "Helps everywhere", linkedin: "https://linkedin.com")
    ]
    @State private var showAddManagerSheet = false
    @State private var managerToEdit: ProjectManagerInfo? = nil
    @State private var editMode: EditMode = .inactive
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(projectManagers) { manager in
                        NavigationLink(destination: ProjectManagerDetailView(pm: manager)){
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(manager.name)
                                        .font(.headline)
                                    
                                }
                            }
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            
                            if editMode == .active {
                                Button(action: {
                                    managerToEdit = manager
                                    showAddManagerSheet = true
                                }) {
                                    Image(systemName: "pencil")
                                        .foregroundColor(.blue)
                                }
                                .buttonStyle(BorderlessButtonStyle())
                                
                                Button(action: {
                                    if let index = projectManagers.firstIndex(where: { $0.id == manager.id }) {
                                        projectManagers.remove(at: index)
                                    }
                                }) {
                                    //                                    Image(systemName: "trash")
                                    //                                        .foregroundColor(.red)
                                }
                                .buttonStyle(BorderlessButtonStyle())
                            }
                        }
                    }
                    .onDelete { offsets in
                        projectManagers.remove(atOffsets: offsets)
                    }
                }
                .navigationTitle("Project Managers")
                .environment(\.editMode, $editMode)  // Bind the editMode to the environment
                .sheet(isPresented: $showAddManagerSheet) {
                    AddProManagerForm(
                        projectManagers: $projectManagers,
                        managerToEdit: $managerToEdit
                    )
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        editMode = (editMode == .active) ? .inactive : .active
                    }) {
                        Text(editMode == .active ? "Done" : "Edit")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        managerToEdit = nil
                        showAddManagerSheet = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

// Preview
struct Managers_Previews: PreviewProvider {
    static var previews: some View {
        Managerss()
    }
}
