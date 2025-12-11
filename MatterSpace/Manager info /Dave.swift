//
//  Dave.swift
//  MatterSpace
//
//  Created by Boitumelo Sialumba on 11/12/2025.
//

import SwiftUI

struct Dave: View {
    @AppStorage("userType") var userType: String = ""
    var body: some View {
            ZStack {
                Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Dave's Information")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Text("Community Education Initiatives at Jamf | Focused on closing educational opportunity gaps through promoting DEIB, accessible education, workforce, and community development in under-severed areas.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    
                    Text("Description")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    
                    Text("Seasoned educational leader with 30+ years of experience advancing STEAM programs, instructional technology, and equitable learning opportunities. Passionate about creating diverse, challenging educational experiences for all students and fostering lifelong learning. Expertise spans classroom teaching, technology integration, certificate-based workforce and community development, and leadership in public, private, and government sectors")
                        .font(.body)
                        .foregroundColor(.black)
                    
                    Text("Contact Details")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    
                    Link("LinkedIn", destination: URL(string: "linkedin.com/in/davesaltmarsh")!)
                        .font(.body)
                        .foregroundColor(.blue)
                    
                }
                .padding(25)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                .padding(.horizontal)
            }
        }
    }

#Preview {
    Dave()
}
