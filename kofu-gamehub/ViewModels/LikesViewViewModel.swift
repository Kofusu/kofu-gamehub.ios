//
//  LikesViewViewModel.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 16/06/25.
//

import Foundation
import CoreData

class LikesViewViewModel: ObservableObject {
    @Published var games: [CoreGameModel]?
    @Published var showMenu = false
    @Published var isLoading = false
    private var context: NSManagedObjectContext
    
    var text = "Kofu GameHub"
    
    init() {
        context = PersistenceController.shared.container.viewContext
    }
    
    func fetchLikedGames() {
        isLoading = true
        let request = NSFetchRequest<CoreGameModel>(entityName: "CoreGameModel")
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            do {
                let results = try self.context.fetch(request)
                self.games = results
                self.isLoading = false
            } catch {
                print("❌ Error Fetching Data: \(error)")
                self.isLoading = false
            }
        }
    }
}
