//
//  StudentDetails.swift
//  MatterSpace
//
//  Created by Octavia Mucheche on 12/12/25.
//

import SwiftUI

struct StudentDetails:View {
    @AppStorage("selectedTab") var selectedTab:String = ""
    @State var student: StudentModel =
    StudentModel(id:"1", name: "Sean", academicInfo: "He joined MCRI in May 2025. He has managed to get certfications in Swift Associate and Jamf certified Associate")
    
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
     
                Text(student.name)
                    .font(.title)
                    .bold()
                Section(header: Text("Description")) {
                    Text(student.academicInfo)
                    
                }
                Spacer()
            }
            .navigationTitle("Student Details")
            .padding()
            
            
        }
    }
}
#Preview {
    StudentDetails()
}
