//
//  HiringCompanies.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 11/12/2025.
//

import SwiftUI

struct HiringCompanies: View {
    @Environment(\.openURL) var openURL
    @State private var hiringCompanies = [
        ("Jamf", "https://www.jamf.com"),
        ("Mainsl", "https://www.mainsl.com"),
        ("Tradition Capital Bank", "https://www.tradition.bank")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(hiringCompanies, id: \.0) { company, link in
                    Text(company)
                        .onTapGesture {
                            if let url = URL(string: link) {
                                openURL(url)
                            }
                        }
                }
            }
            .navigationTitle("Hiring Companies")
        }
    }
}

#Preview {
    HiringCompanies()
}
