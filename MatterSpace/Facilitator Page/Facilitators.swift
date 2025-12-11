//
//  Facilitators.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 11/12/2025.
//

struct Facilitator: Identifiable {
    let id = UUID()
    let name: String
    let details: String
}


let people = [
    Facilitator(
        name: "Peggy",
        details: "Peggy is a senior facilitator with 3 years of experience handling youth workshops."
    ),
    Facilitator(
        name: "Lennon",
        details: "Lennon is responsible for training new facilitators and organizing schedules."
    ),
    Facilitator(
        name: "Nono",
        details: "Nono has a strong background in community development and stakeholder engagement."
    )
]


import SwiftUI

struct Facilitators: View {

    let people = [
        Facilitator(name: "Peggy",
                    details: "Peggy is an IT Consultant-Lead Facilitator at MATTER Career Readiness Institute."),
        Facilitator(name: "Lennon",
                    details: "Lennon is an Experienced Network Administrator with a demonstrated history of working in the computer networking industry. Skilled in Cisco Networking, Python,Java,Firebase, Computer Networking, PHP,MySQL and C/C++. Strong information technology professional with a Bachelor of Computer Science focused in Computer Science from University of Constantine 2.."),
        Facilitator(name: "Nono",
                    details: "Nono is responsible for planning, organizing, and executing a project from beginning to end while ensuring it is completed on time, within budget, and within scope.  ")
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(people) { person in
                    NavigationLink(destination: DetailView(person: person)) {
                        Text(person.name)
                    }
                }
            }
            .navigationTitle("Facilitators")
        }
    }
}
#Preview {
    Facilitators()
}
