//
//  Update.swift
//  MatterSpace
//
//  Created by Benard Chiherenge on 12/12/2025.
//

import Foundation

struct Update: Codable, Identifiable{
    var id: String?
    var imageURL: String?
    var category: String
    var title: String
    var description: String
    var createdAt: String

}
