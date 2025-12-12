//
//  InternDetails.swift
//  MatterSpace
//
//  Created by Octavia Mucheche on 12/12/25.
//

import SwiftUI

struct InternDetails:View {
    @State var intern: Intern =
    Intern(id:"3", name: "Sean", academicInfo: "He joined MCRI in May 2025. He has managed to get certfications in Swift Associate and Jamf certified Associate")
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text(intern.name)
                    .font(.title)
                    .bold()
                
                Section(header: Text("Description")) {
                    Text(intern.academicInfo)
                    
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Intern Details")
        }
    }
        
}
#Preview {
    InternDetails()
}
