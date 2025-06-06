//
//  MainViewViewModels.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import Foundation

class MainViewViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var showMenu = false
    
    @Published var platformList: GamePlatformsModel = GamePlatformsModel(count: 0, next: nil, previous: nil, results: [])
    
    private let session: URLSession
    
    init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        session = URLSession(configuration: config)
        
        fetchPlatforms()
    }
    
    func fetchPlatforms() {
        var components = URLComponents(string: RAWG_BASE_URL+"platforms")
        components?.queryItems = [
            URLQueryItem(name: "key", value: RAWG_API_KEY)
        ]
        
        guard let url = components?.url else { return }
        
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("❌ Error:", error.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("❌ No data received")
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(GamePlatformsModel.self, from: data)
                DispatchQueue.main.async {
                    self.platformList = decoded
                }
            } catch {
                print("❌ Decoding Error: \(error)")
            }
            
        }.resume()
    }
}
