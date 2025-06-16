//
//  DetailGameModel.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 11/06/25.
//

import Foundation

struct DetailGameModel: Codable {
    let id: Int
    let slug: String
    let name: String
    let nameOriginal: String
    let description: String
    let released: String?
    let backgroundImage: String?
    let backgroundImageAdditional: String?
    let website: String?
    let rating: Float16
    let tags: [DetailTag]?

    enum CodingKeys: String, CodingKey {
        case id, slug, name, description, released, website, rating, tags
        case nameOriginal = "name_original"
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
    }
}

struct DetailTag: Codable, Identifiable {
    let id: Int
    let name: String
}
