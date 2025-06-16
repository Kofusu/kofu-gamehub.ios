//
//  DetailGameViewViewModel.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import Foundation
import CoreData
import SwiftUICore

class DetailGameViewViewModel: ObservableObject {
    @Published var gameDetail: DetailGameModel?
    @Published var isLiked = false
    private var context: NSManagedObjectContext
    
    private var detailGameSession: URLSession
    
    init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10
        
        detailGameSession = URLSession(configuration: config)
        context = PersistenceController.shared.container.viewContext
    }
    
    func likeGameHandler(_ game: DetailGameModel) {
        if isLiked {
            let request = NSFetchRequest<CoreGameModel>(entityName: "CoreGameModel")
            request.predicate = NSPredicate(format: "id == %d", game.id)
            DispatchQueue.main.async {
                do {
                    let result = try self.context.fetch(request)
                    for game in result {
                        self.context.delete(game)
                    }
                    try self.context.save()
                } catch {
                    print("❌ Fetch error: \(error)")
                }
            }
        } else {
            let coreGameModel = CoreGameModel(context: context)
            coreGameModel.id = Int64(game.id)
            coreGameModel.slug = game.slug
            coreGameModel.name = game.name
            coreGameModel.backgroundImage = game.backgroundImage
            coreGameModel.released = game.released
            coreGameModel.rating = Float(game.rating)
            
            try? context.save()
        }
        isLiked.toggle()
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
                
                // Check isLiked
                DispatchQueue.main.async {
                    do {
                        let request = NSFetchRequest<CoreGameModel>(entityName: "CoreGameModel")
                        request.predicate = NSPredicate(format: "id == %d", Int64(decoded.id))
                        request.fetchLimit = 1
                        let result = try self.context.fetch(request)
                        self.isLiked = !result.isEmpty
                    } catch {
                        print("❌ Fetch error: \(error)")
                    }
                }
                
                // Add Game
                DispatchQueue.main.async {
                    self.gameDetail = decoded
                }
            } catch {
                print("❌ Decoding Error: \(error)")
            }
        }.resume()
    }
    
}
