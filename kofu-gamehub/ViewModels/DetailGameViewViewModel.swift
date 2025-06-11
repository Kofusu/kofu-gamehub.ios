//
//  DetailGameViewViewModel.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import Foundation

class DetailGameViewViewModel: ObservableObject {
    @Published var gameDetail: DetailGameModel?
    private var detailGameSession: URLSession
    
    init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10
        
        detailGameSession = URLSession(configuration: config)
    }
    
    func fetchDetailGame(_ id: Int) {
        var urlComponents = URLComponents(string: RAWG_BASE_URL+"games/"+String(id))
        urlComponents?.queryItems = [
            URLQueryItem(name: "key", value: RAWG_API_KEY),
        ]
        
        guard let url = urlComponents?.url else { return }
        
        detailGameSession.dataTask(with: url) { data, response, error in
            if let error = error {
                print("❌ Error:", error.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("❌ No data received")
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(DetailGameModel.self, from: data)
                DispatchQueue.main.async {
                    self.gameDetail = decoded
                }
            } catch {
                print("❌ Decoding Error: \(error)")
            }
        }.resume()
    }
    
}
