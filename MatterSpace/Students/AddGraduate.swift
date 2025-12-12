//
//  AddGraduate.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 12/12/2025.
//

import SwiftUI

struct AddGraduate:View {
    @State var name: String = ""
    @State var academicInfo : String = ""
    @Binding var added:Bool
    let graduateService:GraduateService = GraduateService()
    
    var body: some View{
        NavigationStack {
            VStack(alignment: .leading){
                Form {
                    Section(header: Text("Name")) {
                        TextField("Graduate Name", text: $name, axis: .vertical)
                            .lineLimit(3...6)
                    }
                    Section(header: Text("Description")) {
                        TextField("Academic Info", text: $academicInfo)
                    }
                }
                .frame(height: 300)
                .cornerRadius(10)
                .toolbar{
                    ToolbarItem(placement: .primaryAction) {
                        Button{
                           save()
                        }label: {
                            ZStack {
                            Image(systemName: "checkmark")
                            }
                        }
                    }
                }
                
                
            }
            .padding()
            .navigationTitle("Add Graduate")
        }
    }
}
#Preview {
    AddGraduate(added: .constant(true))
}
