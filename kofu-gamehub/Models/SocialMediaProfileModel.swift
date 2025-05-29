//
//  SocialMediaProfileModel.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import Foundation

struct SocialMediaProfileModel: Identifiable {
    var id: URL { url }
    var url: URL
    var icon: String
}
