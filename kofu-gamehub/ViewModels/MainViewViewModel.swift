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

    @Published var tagList: TagsModel?
    @Published var platformList: GamePlatformsModel?
    @Published var popularGameList: GamesModel?
    @Published var newestGameList: GamesModel?
    @Published var topDevList: DevelopersModel?

    private let tagsSession: URLSession
    private let platformSession: URLSession
    private let popularGamesSession: URLSession
    private let newestGamesSession: URLSession
    private let topDevSession: URLSession

    init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30

        tagsSession = URLSession(configuration: config)
        platformSession = URLSession(configuration: config)
        popularGamesSession = URLSession(configuration: config)
        newestGamesSession = URLSession(configuration: config)
        topDevSession = URLSession(configuration: config)

        fetchPlatforms()
        fetchPopularGames()
        fetchNewestGames()
        fetchTopDev()
        fetchTags()
    }

    func fetchTags() {
        var urlComponents = URLComponents(string: rawgBaseUrl+"tags")
        urlComponents?.queryItems = [
            URLQueryItem(name: "key", value: rawgApiKey),
            URLQueryItem(name: "page_size", value: "15")
        ]

        guard let url = urlComponents?.url else { return }

        tagsSession.dataTask(with: url) { data, response, error in
            if let error = error {
                print("❌ Error:", error.localizedDescription)
                return
            }

            guard let data = data else {
                print("❌ No data received")
                return
            }

            do {
                let decoded = try JSONDecoder().decode(TagsModel.self, from: data)
                DispatchQueue.main.async {
                    self.tagList = decoded
                }
            } catch {
                print("❌ Decoding Error: \(error)")
            }
        }.resume()
    }

    func fetchTopDev() {
        var components = URLComponents(string: rawgBaseUrl+"developers")
        components?.queryItems = [
            URLQueryItem(name: "key", value: rawgApiKey),
            URLQueryItem(name: "page_size", value: "5")
        ]

        guard let url = components?.url else { return }

        topDevSession.dataTask(with: url) { data, response, error in
            if let error = error {
                print("❌ Error:", error.localizedDescription)
                return
            }

            guard let data = data else {
                print("❌ No data received")
                return
            }

            do {
                let decoded = try JSONDecoder().decode(DevelopersModel.self, from: data)
                DispatchQueue.main.async {
                    self.topDevList = decoded
                }
            } catch {
                print("❌ Decoding Error: \(error)")
            }
        }.resume()
    }

    func fetchNewestGames() {
        var components = URLComponents(string: rawgBaseUrl+"games")
        components?.queryItems = [
            URLQueryItem(name: "key", value: rawgApiKey),
            URLQueryItem(name: "page_size", value: "10"),
            URLQueryItem(name: "ordering", value: "-created")
        ]

        guard let url = components?.url else { return }

        popularGamesSession.dataTask(with: url) { data, response, error in
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
                    self.newestGameList = decoded
                }
            } catch {
                print("❌ Decoding Error: \(error)")
            }
        }.resume()
    }

    func fetchPopularGames() {
        var components = URLComponents(string: rawgBaseUrl+"games")
        components?.queryItems = [
            URLQueryItem(name: "key", value: rawgApiKey),
            URLQueryItem(name: "page_size", value: "10"),
            URLQueryItem(name: "ordering", value: "-rating")
        ]

        guard let url = components?.url else { return }

        popularGamesSession.dataTask(with: url) { data, response, error in
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
                    self.popularGameList = decoded
                }
            } catch {
                print("❌ Decoding Error: \(error)")
            }
        }.resume()
    }

    func fetchPlatforms() {
        var components = URLComponents(string: rawgBaseUrl+"platforms")
        components?.queryItems = [
            URLQueryItem(name: "key", value: rawgApiKey)
        ]

        guard let url = components?.url else { return }

        platformSession.dataTask(with: url) { data, response, error in
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
