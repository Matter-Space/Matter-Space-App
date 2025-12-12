//
//  Nono.swift
//  MatterSpace
//
//  Created by Boitumelo Sialumba on 11/12/2025.
//

import SwiftUI

struct Nono: View {
    @AppStorage("userType") var userType: String = ""
    @State private var showAddProManagertasks = false
    @State private var projectManagers: [ProjectManagerInfo] = []
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Building Pool") {
                    
                }
            }
            .navigationTitle("Projects")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddProManagertasks = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddProManagertasks) {
                AddProManagerForm(projectManagers: $projectManagers)
            }
        }
    }
}

#Preview {
    Nono()
}
