//
//  ProjectManagers.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 11/12/2025.
//

import SwiftUI
struct ProjectManagerDetailView: View {
    let pm: ProjectManagerInfo
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGray6)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                
                // TITLE + ROLE SECTION
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(pm.name)'s Information")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text(pm.role)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                // DESCRIPTION LABEL
                Text("Description")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                // DESCRIPTION TEXT
                Text(pm.description)
                    .font(.body)
                    .foregroundColor(.black)
                
                // CONTACT LABEL
                Text("Contact Details")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                // LINKEDIN LINK
                if let url = URL(string: pm.linkedin) {
                    Link("LinkedIn", destination: url)
                        .font(.body)
                        .foregroundColor(.blue)
                }
            }
            .padding(25)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
            .padding(.horizontal)
        }
        .navigationTitle(pm.name)
    }
}
struct ProjectManagers: View {
    @AppStorage("userType") var userType: String = ""
    @State private var showAddProManagerForm = false
    
    
    @State private var projectManagers: [ProjectManagerInfo] = [
        ProjectManagerInfo(
            name: "Nono",
            role: "Senior Project Manager",
            description: "Nono oversees community education projects and ensures smooth operations.",
            linkedin: "https://www.linkedin.com/in/nono"
        )
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(projectManagers) { projectManager in
                    NavigationLink(destination: ProjectManagerDetailView(pm: projectManager)) {
                        Text(projectManager.name)
                    }
                }
            }
            .navigationTitle("Project Managers")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddProManagerForm = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddProManagerForm) {
                AddProManagerForm(projectManagers: $projectManagers)
            }
        }
    }
}


#Preview {
    ProjectManagers()
}
