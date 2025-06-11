//
//  ListGameViewViewModel.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import Foundation
import Combine

enum GameListOrdering: String {
    case created = "created"
    case popular = "rating"
}

enum GameListSort: String {
    case asc = ""
    case desc = "-"
}

class ListGameViewViewModel: ObservableObject {
    @Published var hasSearch: Bool = false
    @Published var text: String = ""
    @Published var ordering: GameListOrdering?
    @Published var sorting: GameListSort = .desc
    @Published var showMenu = false
    @Published var isLoading = false
    @Published var listGame: GamesModel?

    private var cancellables = Set<AnyCancellable>()
    private var gameSession: URLSession

    init(ordering: GameListOrdering? = nil, hasSearch: Bool = false) {
        self.ordering = ordering
        self.hasSearch = hasSearch

        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10
        gameSession = URLSession(configuration: config)

        setupBindings()
    }

    private func setupBindings() {
        $text
            .removeDuplicates()
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink { [weak self] newText in
                guard let self = self, self.hasSearch else { return }
                self.fetchListGames()
            }
            .store(in: &cancellables)
    }

    func fetchListGames() {
        guard let ordering = ordering else { return }

        let orderingValue = sorting.rawValue + ordering.rawValue

        var components = URLComponents(string: RAWG_BASE_URL + "games")
        components?.queryItems = [
            URLQueryItem(name: "key", value: RAWG_API_KEY),
            URLQueryItem(name: "page_size", value: hasSearch ? "10" : "100"),
            URLQueryItem(name: "ordering", value: hasSearch ? "" : orderingValue),
            URLQueryItem(name: "search", value: hasSearch ? text : "")
        ]

        guard let url = components?.url else { return }

        isLoading = true
        gameSession.dataTask(with: url) { data, response, error in
            if let error = error {
                print("❌ Error:", error.localizedDescription)
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                return
            }

            guard let data = data else {
                print("❌ No data received")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
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

    func updateOrderingAndSorting(ordering: GameListOrdering, sorting: GameListSort) {
        if self.ordering != ordering || self.sorting != sorting {
            self.ordering = ordering
            self.sorting = sorting
            fetchListGames()
        }
    }
}
