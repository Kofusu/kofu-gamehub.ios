//
//  DevelopersModel.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 09/06/25.
//

import Foundation

struct DeveloperModel: Codable, Identifiable {
    let id: Int
    let name: String
    let slug: String
    let gamesCount: Int
    let imageBackground: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }
}

struct DevelopersModel: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [DeveloperModel]
}
