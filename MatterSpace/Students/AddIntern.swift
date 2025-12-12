//
//  AddIntern.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 12/12/2025.
//

import SwiftUI

struct AddIntern:View {
    @State var name: String = ""
    @State var academicInfo : String = ""
    @Binding var added:Bool
    let internService: InternService = InternService()
    var body: some View{
        NavigationStack {
            VStack(alignment: .leading){
                Form {
                    Section(header: Text("Name")) {
                        TextField("Intern Name", text: $name, axis: .vertical)
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
                          Save()
                        }label: {
                            ZStack {
                            Image(systemName: "checkmark")
                            }
                        }
                    }
                }
                
                
            }
            .padding()
            .navigationTitle("Add Intern")
        }
    }
}
#Preview {
    AddIntern(added: .constant(true))
}
