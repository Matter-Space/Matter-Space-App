//
//  Managers.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 11/12/2025.
//


//import SwiftUI
//struct ManagerDetailView: View {
//    let manager: Manager
//
//    var body: some View {
//        ZStack {
//            Color(UIColor.systemGray6)
//                .edgesIgnoringSafeArea(.all)
//
//            VStack(alignment: .leading, spacing: 20) {
//
//
//                VStack(alignment: .leading, spacing: 5) {
//                    Text("\(manager.name)'s Information")
//                        .font(.title)
//                        .fontWeight(.semibold)
//                        .foregroundColor(.black)
//
//                    Text(manager.role)
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                }
//
//
//                Text("Description")
//                    .font(.headline)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.black)
//
//
//                Text(manager.description)
//                    .font(.body)
//                    .foregroundColor(.black)
//
//
//                Text("Contact Details")
//                    .font(.headline)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.black)
//
//
//                if let url = URL(string: manager.linkedin) {
//                    Link("LinkedIn", destination: url)
//                        .font(.body)
//                        .foregroundColor(.blue)
//                }
//
//            }
//            .padding(25)
//            .background(Color.white)
//            .cornerRadius(10)
//            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
//            .padding(.horizontal)
//        }
//        .navigationTitle(manager.name)
//    }
//}
//
//struct Managers: View {
//    @AppStorage("userType") var userType: String = ""
//    @State private var showAddManagerForm = false
//    @State private var managers: [Manager] = []
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(managers) { manager in
//                    NavigationLink(destination: ManagerDetailView(manager: manager)) {
//                        Text(manager.name)
//                    }
//                }
//            }
//            .navigationTitle("Managers")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button(action: {
//                        showAddManagerForm = true
//                    }) {
//                        Image(systemName: "plus")
//                            .font(.title3)
//                    }
//                }
//            }
//
//            .sheet(isPresented: $showAddManagerForm) {
//                AddManagerForm(managers: $managers)
//            }
//        }
//    }
//}
//
//#Preview {
//    Managers()
//}
import SwiftUI




import SwiftUI


import SwiftUI

struct ManagerDetailView: View {
    let manager: Manager
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGray6)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(manager.name)'s Information")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text(manager.role)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Text("Description")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text(manager.description)
                    .font(.body)
                    .foregroundColor(.black)
                
                Text("Contact Details")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                if let url = URL(string: manager.linkedin) {
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
        .navigationTitle(manager.name)
    }
}

struct Managers: View {
    @AppStorage("userType") var userType: String = ""
    @State private var showAddManagerForm = false
    @State private var managers: [Manager] = [
        Manager(name: "Tsitsi", role: "Lead", description: "Great manager", linkedin: "https://linkedin.com"),
        
    ]
    @State private var managerToEdit: Manager? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(managers.indices, id: \.self) { index in
                    NavigationLink(destination: ManagerDetailView(manager: managers[index])) {
                        HStack {
                            Text(managers[index].name)
                            Spacer()
                            
                            Button(action: {
                                
                                managerToEdit = managers[index]
                                showAddManagerForm = true
                            }) {
                                Image(systemName: "pencil")
                                    .foregroundColor(.blue)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }
                .onDelete(perform: deleteManager)
            }
            .navigationTitle("Managers")
            .sheet(isPresented: $showAddManagerForm) {
                AddManagerForm(managers: $managers, managerToEdit: $managerToEdit)
            }
        }
    }
    
}
private func deleteManager(at offsets: IndexSet) {
}




#Preview {
    Managers()
}
