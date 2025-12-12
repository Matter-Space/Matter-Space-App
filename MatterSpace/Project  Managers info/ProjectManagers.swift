//
//  ProjectManagers.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 11/12/2025.
//

import SwiftUI
import SwiftUI

struct ProjectManagerInfomation: Identifiable {
    var id: UUID = UUID()
    var name: String
    var role: String
    var description: String
    var linkedin: String
}

struct ProjectManagerDetailView: View {
    let pm: ProjectManagerInfo
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGray6)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                
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


struct ProjectManagerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectManagerDetailView(pm: ProjectManagerInfo(
            name: "John Doe",
            role: "Senior Project Manager",
            description: "John oversees project operations and ensures smooth execution.",
            linkedin: "https://www.linkedin.com/in/johndoe"
        ))
    }
}
