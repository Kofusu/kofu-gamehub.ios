//
//  LikesViewViewModel.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 16/06/25.
//

import Foundation

class LikesViewViewModel: ObservableObject {
    @Published var games: GamesModel?
    @Published var showMenu = false
    @Published var isLoading = false
    
    var text = "Kofu GameHub"
}
