//
//  DetailGameViewViewModel.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import Foundation

class DetailGameViewViewModel: ObservableObject {
    let tags = ["UI/UX", "Frontend Engineering", "Machine Learning", "Web Development", "Mobile App Development", "3D"]
    
    @Published var text = "DetailGameView"
}
