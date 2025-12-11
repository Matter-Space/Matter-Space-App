//
//  Students.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 11/12/2025.
//



import SwiftUI

struct Students: View {
    @State private var selectedUser = "Students"
    
    let users = ["Students", "Interns", "Graduates"]
    
    @State private var names: [String: [String]] = [
        "Students": ["Benard","Sean","Crown", "Octavia", "Boity"],
        "Interns": ["Anita","Albetina","Ntombie", "Mildred", "Pertunia", "Tafarel"],
        "Graduates": ["Tanaka", "Marshal", "Craig"]
    ]
    
    @State private var newName = ""
    @State private var showingEditAlert = false
    @State private var nameToEdit = ""
    @State private var editedName = ""
    
    var currentNames: [String] {
        names[selectedUser] ?? []
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Picker("Select User Type", selection: $selectedUser) {
                    ForEach(users, id: \.self) { user in
                        Text(user)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                List {
                    ForEach(currentNames, id: \.self) { name in
                        // Navigate to the corresponding page
                        NavigationLink {
                            destinationView(for: selectedUser, name: name)
                        } label: {
                            Text(name)
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: false) {
                            Button("Edit") { startEditing(name) }
                                .tint(.blue)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) { deleteName(name) } label: {
                                Image(systemName: "trash")
                            }
                        }
                    }
                    
                    
                    HStack {
                        TextField("Enter new name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                        Button("Add") { addName() }
                            .buttonStyle(.borderedProminent)
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Users")
            .alert("Edit Name", isPresented: $showingEditAlert) {
                TextField("New name", text: $editedName)
                Button("Save") { saveEditedName() }
                Button("Cancel", role: .cancel) {}
            }
        }
    }
    
   
    @ViewBuilder
    func destinationView(for userType: String, name: String) -> some View {
        switch userType {
        case "Students":
            StudentPage(name: name)
        case "Interns":
            InternPage(name: name)
        case "Graduates":
            GraduatePage(name: name)
        default:
            Text(name)
        }
    }
    
    
    func addName() {
        guard !newName.isEmpty else { return }
        let formatted = newName.capitalized
        names[selectedUser, default: []].append(formatted)
        newName = ""
    }
    
   
    func deleteName(_ name: String) {
        names[selectedUser]?.removeAll { $0 == name }
    }
    
    
    func startEditing(_ name: String) {
        nameToEdit = name
        editedName = name
        showingEditAlert = true
    }
    
    func saveEditedName() {
        guard !editedName.isEmpty else { return }
        if let index = names[selectedUser]?.firstIndex(of: nameToEdit) {
            names[selectedUser]?[index] = editedName.capitalized
        }
    }
}


struct StudentPage: View {
    let name: String
    var body: some View {
        Text("Student Page for \(name)")
            .font(.largeTitle)
            .padding()
    }
}

struct InternPage: View {
    let name: String
    var body: some View {
        Text("Intern Page for \(name)")
            .font(.largeTitle)
            .padding()
    }
}

struct GraduatePage: View {
    let name: String
    var body: some View {
        Text("Graduate Page for \(name)")
            .font(.largeTitle)
            .padding()
    }
}

#Preview {
    Students()
}
