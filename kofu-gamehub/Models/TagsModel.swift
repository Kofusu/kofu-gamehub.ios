//
//  TagsModel.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 10/06/25.
//

import Foundation

struct TagsModel: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Tag]
}

struct Tag: Codable, Identifiable {
    let id: Int
    let name: String
    let slug: String
    let gamesCount: Int
    let imageBackground: URL?
    let language: String
    let games: [Game]

    enum CodingKeys: String, CodingKey {
        case id, name, slug, language, games
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        slug = try container.decode(String.self, forKey: .slug)
        gamesCount = try container.decode(Int.self, forKey: .gamesCount)
        language = try container.decode(String.self, forKey: .language)
        games = try container.decode([Game].self, forKey: .games)
        
        let imageURLString = try container.decode(String.self, forKey: .imageBackground)
        imageBackground = URL(string: imageURLString)
    }
}

struct Game: Codable {
    let id: Int
    let slug: String
    let name: String
    let added: Int
}
