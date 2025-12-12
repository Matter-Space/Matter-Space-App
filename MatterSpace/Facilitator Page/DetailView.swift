//
//  DetailView.swift
//  MatterSpace
//
//  Created by Crown Sipho on 11/12/2025.
//


import SwiftUI

struct DetailView: View {
    let person: Facilitator
    
    var body: some View {
        ScrollView {
            ZStack {
                Color(UIColor.systemGray6)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("\(person.name)'s Information")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Text(person.role)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Text("Description")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Text(person.description)
                        .font(.body)
                        .foregroundColor(.black)
                    
                    Text("Contact Details")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    if let url = URL(string: person.linkedin) {
                        Link("LinkedIn", destination: url)
                            .foregroundColor(.blue)
                    }
                    
                }
                .padding(25)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                .padding()
            }
        }
        .navigationTitle(person.name)
    }
}
