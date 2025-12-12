//
//  GraduateDetails.swift
//  MatterSpace
//
//  Created by Octavia Mucheche on 12/12/25.
//

import SwiftUI

struct GraduateDetails:View {
    @State var graduate = Graduate(id:"2", name: "Muzi", academicInfo: "He is a programmer analyst at Mains'l solutions.")
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text(graduate.name)
                    .font(.title)
                    .bold()
                
                Section(header: Text("Description")) {
                    Text(graduate.academicInfo)
                    
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Graduate Details")
        }
    }
}
#Preview {
    GraduateDetails()
}
