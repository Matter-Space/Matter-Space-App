//
//  HomePage.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 11/12/2025.
//

import SwiftUI

struct HomePage: View {
    @AppStorage("userType") var userType: String = ""
    var body: some View {
        NavigationView{
            List(){
                NavigationLink("Donors"){
                    Donors()
                }
                .listRowInsets(EdgeInsets(top: 30, leading:26, bottom: 30, trailing: 26))
                NavigationLink("Hiring Companies"){
                    HiringCompanies()
                }
                .listRowInsets(EdgeInsets(top: 30, leading:26, bottom: 30, trailing: 26))
                NavigationLink("Managers"){
                    Managers()
                }
                .listRowInsets(EdgeInsets(top: 30, leading:26, bottom: 30, trailing: 26))
                NavigationLink("Project Manager"){
                    ProjectManagers()
                }
                .listRowInsets(EdgeInsets(top: 30, leading:26, bottom: 30, trailing: 26))
                NavigationLink("Facilitators"){
                    Facilitators()
                }
                .listRowInsets(EdgeInsets(top: 30, leading:26, bottom: 30, trailing: 26))
                NavigationLink("Students"){
                    Students()
                }
                .listRowInsets(EdgeInsets(top: 30, leading:26, bottom: 30, trailing: 26))
            
            }
            
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomePage()
}
