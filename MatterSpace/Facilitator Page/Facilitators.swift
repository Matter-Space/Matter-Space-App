//
//  Facilitators.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 11/12/2025.
//

import SwiftUI

struct Facilitator: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var role: String
    var description: String
    var linkedin: String
}



struct Facilitators: View {
    
    @State private var facilitators: [Facilitator] = [
        Facilitator(
            name: "Lennon",
            role: "Full stack engineer",
            description: "Experienced Network Administrator with a demonstrated history of working in the computer networking industry. Skilled in Cisco Networking, Python,Java,Firebase, Computer Networking, PHP,MySQL and C/C++. Strong information technology professional with a Bachelor of Computer Science focused in Computer Science from University of Constantine 2.",
            linkedin: "https://linkedin.com"
        ),
        Facilitator(
            name: "Peggy",
            role: "Lead Facilitator - MCRI",
            description: "Peggy is an IT Consultant and Lead Facilitator at MATTER Career Readiness Institute.",
            linkedin: "https://linkedin.com"
        ),
        Facilitator(
            name: "Nono",
            role: "Profect manager- MCRI",
            description: "Nono is responsible for planning, executing, and closing projects while managing the constraints of scope, schedule, budget, resources, quality, and risk.",
            linkedin: "https://linkedin.com"
        ),
    ]
    
    @State private var showAdd = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(facilitators) { person in
                    NavigationLink(destination: DetailView(person: person)) {
                        VStack(alignment: .leading) {
                            Text(person.name)
                                .font(.headline)
                            Text(person.role)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 6)
                    }
                }
                .onDelete(perform: deleteItem)
            }
            .navigationTitle("Facilitators")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAdd = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAdd) {
                AddFacilitatorView(facilitators: $facilitators)
            }
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        facilitators.remove(atOffsets: offsets)
    }
}

struct AddFacilitatorView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var facilitators: [Facilitator]
    
    @State private var name = ""
    @State private var role = ""
    @State private var description = ""
    @State private var linkedin = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Basic Info")) {
                    TextField("Name", text: $name)
                    TextField("Role", text: $role)
                }
                
                Section(header: Text("Description")) {
                    TextField("Description", text: $description, axis: .vertical)
                        .lineLimit(3...6)
                }
                
                Section(header: Text("Contact")) {
                    TextField("LinkedIn URL", text: $linkedin)
                }
            }
            .navigationTitle("Add Facilitator")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let newPerson = Facilitator(
                            name: name,
                            role: role,
                            description: description,
                            linkedin: linkedin
                        )
                        facilitators.append(newPerson)
                        dismiss()
                    }
                    .disabled(name.isEmpty || role.isEmpty || description.isEmpty)
                }
            }
        }
    }
}


#Preview{
    Facilitators()
}
