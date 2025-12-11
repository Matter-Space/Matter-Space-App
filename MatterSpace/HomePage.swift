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
                    .listRowInsets(EdgeInsets(top:40, leading:16, bottom:40, trailing:16))
                    
                    NavigationLink("Hiring Companies"){
                        HiringCompanies()
                    }
                    .listRowInsets(EdgeInsets(top:40, leading:16, bottom:40, trailing:16))
                    
                    NavigationLink("Managers"){
                        Managers()
                    }
                    .listRowInsets(EdgeInsets(top:40, leading:16, bottom:40, trailing:16))
                    
                    NavigationLink("Project Manager"){
                        ProjectManagers()
                    }
                    .listRowInsets(EdgeInsets(top:40, leading:16, bottom:40, trailing:16))
                    
                    
                    NavigationLink("Facilitators"){
                        Facilitators()
                    }
                    .listRowInsets(EdgeInsets(top:40, leading:16, bottom:40, trailing:16))
                    
                    NavigationLink("Students"){
                        Students()
                    }
                    .listRowInsets(EdgeInsets(top:40, leading:16, bottom:40, trailing:16))
                    
                }
               .fontWeight(.bold)
                .navigationTitle("Home")
            }
        }
    }

#Preview {
    HomePage()
}
