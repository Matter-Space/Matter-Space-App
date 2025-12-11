//
//  Donors.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 11/12/2025.
//

import SwiftUI

struct Donors: View {
    @Environment(\.openURL) var openURL
    @AppStorage("token") var token: String = ""
    
    @State private var donors = [
        ("Matter", "https://www.matter.ngo"),
        ("Love for Africa", "https://loveforafrica.net/locations/zimbabwe/")
    ]
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(donors, id: \.0) { name, url in
                    Text(name)
                        .onTapGesture {
                            if let link = URL(string: url) {
                                openURL(link)
                            }
                        }
                }
            }
            .toolbar(.hidden,for: .navigationBar)
        }
        .navigationTitle("Donors")
    }
}
#Preview {
    Donors()
}
