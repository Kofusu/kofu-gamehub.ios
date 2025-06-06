//
//  GamePlatformsModel.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 06/06/25.
//

import Foundation

struct GamePlatform: Codable, Identifiable {
    let id: Int
    let name: String
    let slug: String
    let gamesCount: Int
    let imageBackground: String
    let image: String?
    let yearStart: Int?
    let yearEnd: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case image
        case yearStart
        case yearEnd
    }
}

struct GamePlatformsModel: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [GamePlatform]
}
