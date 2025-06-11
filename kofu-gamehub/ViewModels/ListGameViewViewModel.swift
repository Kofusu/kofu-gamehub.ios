//
//  ListGameViewViewModel.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import Foundation

enum GameListOrdering: String {
    case created = "created"
    case popular = "rating"
}

enum GameListSort: String {
    case asc = ""
    case desc = "-"
}

class ListGameViewViewModel: ObservableObject {
    @Published var text: String = "Kofu GameHub"
    @Published var ordering: GameListOrdering?
    @Published var sorting: GameListSort = .desc
    @Published var showMenu = false
    @Published var isLoading = false
    @Published var listGame: GamesModel?
    
    var gameSession: URLSession
    
    init(_ ordering: GameListOrdering? = .none) {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10
        
        gameSession = URLSession(configuration: config)
        self.ordering = ordering
    }
    
    func fetchListGames() {
        guard let ordering = ordering else { return }
        
        // Kombinasikan sorting dengan ordering
        let orderingValue = sorting.rawValue + ordering.rawValue
        
        var components = URLComponents(string: RAWG_BASE_URL+"games")
        components?.queryItems = [
            URLQueryItem(name: "key", value: RAWG_API_KEY),
            URLQueryItem(name: "page_size", value: "100"),
            URLQueryItem(name: "ordering", value: orderingValue)
        ]
        
        guard let url = components?.url else { return }
        
        isLoading = true
        gameSession.dataTask(with: url) { data, response, error in
            if let error = error {
                print("❌ Error:", error.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("❌ No data received")
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(GamesModel.self, from: data)
                DispatchQueue.main.async {
                    self.listGame = decoded
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    print("❌ Decoding Error: \(error)")
                    self.isLoading = false
                }
            }
        }.resume()
    }
    
    // Method untuk update ordering
    func updateOrderingAndSorting(ordering: GameListOrdering, sorting: GameListSort) {
        if self.ordering != ordering || self.sorting != sorting {
            self.ordering = ordering
            self.sorting = sorting
            fetchListGames()
        }
    }
}
