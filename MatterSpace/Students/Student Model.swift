//
//  Student Model.swift
//  MatterSpace
//
//  Created by Octavia Mucheche on 12/11/25.
//

import Foundation

struct StudentModel: Codable, Identifiable, Hashable{
    var id: String?
    var name: String
    var academicInfo: String
}

struct Intern: Codable, Identifiable, Hashable{
    var id: String?
    var name: String
    var academicInfo: String
}

struct Graduate: Codable, Identifiable, Hashable{
    var id: String?
    var name: String
    var academicInfo: String
}
