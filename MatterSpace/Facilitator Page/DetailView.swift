//
//  DetailView.swift
//  MatterSpace
//
//  Created by Crown Sipho on 11/12/2025.
//


import SwiftUI

struct DetailView: View {
    let person: Facilitator

    var body: some View {
        
        VStack(alignment: .leading, spacing: 100) {
            Text(person.name)
                .font(.largeTitle)
                .bold()
                

            Text(person.details)
                .foregroundColor(.black)
                .bold()
            

            Spacer()
        }
        .padding()
//        .navigationTitle(person.name)
    }
}


#Preview {
    DetailView(person: Facilitator(
        name: "Peggy",
        details: "Peggy is a senior facilitator with 3 years of experience handling youth workshops."
    ))
}











