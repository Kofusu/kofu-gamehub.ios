//
//  GamesModel.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 06/06/25.
//

import Foundation

struct GameModel: Codable, Identifiable {
    let id: Int
    let slug: String
    let name: String
    let released: String?
    let backgroundImage: String?
    let rating: Float16
    let updated: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case slug
        case name
        case released
        case backgroundImage = "background_image"
        case rating
        case updated
    }
}

struct GamesModel: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [GameModel]
}
