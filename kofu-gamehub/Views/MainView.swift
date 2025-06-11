//
//  ContentView.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                // Header
                NavbarHeader(text: $viewModel.searchText, showMenu: $viewModel.showMenu)
                    .confirmationDialog("MainMenu", isPresented: $viewModel.showMenu) {
                        NavigationLink {
                            ProfileView()
                        } label: {
                            Text("Creator Profile")
                        }
                    }
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Game Tags
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                if let tags = viewModel.tagList {
                                    ForEach(tags.results) { result in
                                        Tags(text: result.name)
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                        
                        // Platforms
                        PlatformSection
                        
                        // Popular Games
                        PopularGameSection
                        
                        // Newest Games
                        NewestGameSection
                        
                        // Top Developer
                        TopDeveloperSection
                    }
                }
            }.background(.darkBlue)
        }
    }
    
    @ViewBuilder
    var PlatformSection: some View {
        VStack(alignment: .leading) {
            Text("Platforms")
                .font(.custom("VT323-Regular", size: 20))
                .dynamicTypeSize(.medium ... .accessibility5)
                .foregroundStyle(.lightCyan)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    if let platformList = viewModel.platformList {
                        ForEach(platformList.results) { result in
                            VStack {
                                AsyncImage(url: URL(string: result.image ?? result.imageBackground)) { phase in
                                    switch phase {
                                    case .empty:
                                        // Loading state
                                        ProgressView()
                                            .frame(width: 100, height: 100)
                                            .background(Color.gray.opacity(0.3))
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                        
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .clipped()
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                        
                                    case .failure(_):
                                        // Fallback image
                                        Image(systemName: "photo.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .foregroundColor(.gray)
                                            .background(Color.gray.opacity(0.2))
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                        
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                Text(result.name)
                                    .font(.custom("VT323-Regular", size: 20))
                                    .dynamicTypeSize(.medium ... .accessibility5)
                                    .foregroundStyle(.lightCyan)
                            }
                        }
                    }
                }
                .frame(height: 130)
            }
        }.padding(.horizontal, 16)
    }
    
    @ViewBuilder
    var PopularGameSection: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Popular Games")
                    .font(.custom("VT323-Regular", size: 20))
                    .dynamicTypeSize(.medium ... .accessibility5)
                    .foregroundStyle(.lightCyan)
                Spacer()
                NavigationLink {
                    ListGameView(ordering: .popular, sorting: .desc)
                } label: {
                    Image("pixel_angle-right-solid")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 17, height: 17)
                        .foregroundStyle(.lightCyan)
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    if let games = viewModel.popularGameList {
                        ForEach(games.results) {game in
                            if let url = URL(string: game.backgroundImage ?? "") {
                                GameCard(id: game.id, imageURL: url, rating: game.rating, name: game.name)
                            }

                        }
                    }
                }
                .frame(height: 130)
            }
        }.padding(.horizontal, 16)
    }
    
    @ViewBuilder
    var NewestGameSection: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Newest Games")
                    .font(.custom("VT323-Regular", size: 20))
                    .dynamicTypeSize(.medium ... .accessibility5)
                    .foregroundStyle(.lightCyan)
                Spacer()
                NavigationLink {
                    ListGameView(ordering: .created, sorting: .desc)
                } label: {
                    Image("pixel_angle-right-solid")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 17, height: 17)
                        .foregroundStyle(.lightCyan)
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    if let games = viewModel.newestGameList {
                        ForEach(games.results) {game in
                            if let url = URL(string: game.backgroundImage ?? "") {
                                GameCard(id: game.id, imageURL: url, rating: game.rating, name: game.name)
                            }

                        }
                    }
                }
                .frame(height: 130)
            }
        }.padding(.horizontal, 16)
    }
    
    @ViewBuilder
    var TopDeveloperSection: some View {
        VStack(alignment: .leading) {
            LazyHStack {
                Text("Top Developer")
                    .font(.custom("VT323-Regular", size: 20))
                    .dynamicTypeSize(.medium ... .accessibility5)
                    .foregroundStyle(.lightCyan)
                Spacer()
            }
            
            LazyVStack(spacing: 16) {
                if let developer = viewModel.topDevList {
                    ForEach(developer.results) { item in
                        GameInfoComponent(id: item.id, readOnlyComponent: true, name: item.name, description: "\(item.gamesCount) Games", image: URL(string: item.imageBackground!)!)
                    }
                }
            }
        }.padding(.horizontal, 16)
    }
}

#Preview {
    MainView()
}
