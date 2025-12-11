//
//  TabsPage.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 11/12/2025.
//

import SwiftUI

struct TabsPage: View {
    var body: some View {
        TabView{
            HomePage()
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                        
                }
            Community()
                .tabItem {
                    Label("Community", systemImage: "person.3.fill")
                       
                }
                
            }
        
        }

    }


#Preview {
    TabsPage()
}
