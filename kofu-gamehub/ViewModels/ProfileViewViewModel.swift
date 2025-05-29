//
//  ProfileViewViewModel.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import Foundation

class ProfileViewViewModel: ObservableObject {    
    let interest = ["UI/UX", "Frontend Engineering", "Machine Learning", "Web Development", "Mobile App Development", "3D"]
    
    let socialMedia = [
        SocialMediaProfileModel(
            url: URL(string:"https://www.linkedin.com/in/hendratara")!,
            icon: "pixel_linkedin"
        ),
        SocialMediaProfileModel(
            url: URL(string:"https://www.instagram.com/hendratara95")!,
            icon: "pixel_instagram"
        ),
        SocialMediaProfileModel(
            url: URL(string:"https://github.com/Kofusu")!,
            icon: "pixel_github"
        ),
        SocialMediaProfileModel(
            url: URL(string:"mailto: hendratara95@gmail.com")!,
            icon: "pixelarticons_mail"
        ),
    ]
}
