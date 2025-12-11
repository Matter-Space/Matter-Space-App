//
//  Tsitsi.swift
//  MatterSpace
//
//  Created by Boitumelo Sialumba on 11/12/2025.
//
import SwiftUI

struct Tsitsi: View {
    @AppStorage("userType") var userType: String = ""
    var body: some View {
        ZStack {
            Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 20) {
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Tsitsi's Information")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text("MATTER Education in Zimbabwe-Program Manager at MATTER ®")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                
                Text("Description")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                
                Text("Tsitsi is an accomplished professional currently serving as a Program Manager at MATTER Education in Zimbabwe, where she plays a pivotal role in overseeing high-impact educational initiatives and ensuring their successful implementation across the country. In addition to her program management responsibilities, she contributes strategically as Country Manager, driving operational excellence and fostering collaboration among diverse stakeholders to advance MATTER’s mission in Zimbabwe. Tsitsi holds a Bachelor’s Degree in Human Resources Management from Zimbabwe Open University, where she developed a strong foundation in personnel administration and organizational development.")
                    .font(.body)
                    .foregroundColor(.black)
                
                Text("Contact Details")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                
                Link("LinkedIn", destination: URL(string: "https://www.linkedin.com/in/tsitsi-murohoke-1895bb304")!)
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
    Tsitsi()
}
