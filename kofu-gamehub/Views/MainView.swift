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
                                Tags(text: "Hello")
                                Tags(text: "Hello")
                                Tags(text: "Hello")
                                Tags(text: "Hello")
                                Tags(text: "Hello")
                                Tags(text: "Hello")
                                Tags(text: "Hello")
                            }
                            .padding(.horizontal, 16)
                        }
                        
                        // Platforms
                        VStack(alignment: .leading) {
                            Text("Platforms")
                                .font(.custom("VT323-Regular", size: 20))
                                .dynamicTypeSize(.medium ... .accessibility5)
                                .foregroundStyle(.lightCyan)
                            
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 16) {
                                    NavigationLink {
                                        ListGameView()
                                    } label: {
                                        VStack {
                                            
                                            Image("profile-cover")
                                                .resizable()
                                                .frame(width: 100, height: 100)
                                            Text("Playstation")
                                                .font(.custom("VT323-Regular", size: 20))
                                                .dynamicTypeSize(.medium ... .accessibility5)
                                                .foregroundStyle(.lightCyan)
                                        }
                                    }
                                }
                                .frame(height: 130)
                            }
                        }.padding(.horizontal, 16)
                        
                        // Popular Games
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Popular Games")
                                    .font(.custom("VT323-Regular", size: 20))
                                    .dynamicTypeSize(.medium ... .accessibility5)
                                    .foregroundStyle(.lightCyan)
                                Spacer()
                                NavigationLink {
                                    ListGameView()
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
                                    GameCard()
                                    GameCard()
                                    GameCard()
                                }
                                .frame(height: 130)
                            }
                        }.padding(.horizontal, 16)
                        
                        // Newest Games
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Newest Games")
                                    .font(.custom("VT323-Regular", size: 20))
                                    .dynamicTypeSize(.medium ... .accessibility5)
                                    .foregroundStyle(.lightCyan)
                                Spacer()
                                NavigationLink {
                                    ListGameView()
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
                                    GameCard()
                                    GameCard()
                                    GameCard()
                                }
                                .frame(height: 130)
                            }
                        }.padding(.horizontal, 16)
                        
                        // Top Developer
                        VStack(alignment: .leading) {
                            LazyHStack {
                                Text("Top Developer")
                                    .font(.custom("VT323-Regular", size: 20))
                                    .dynamicTypeSize(.medium ... .accessibility5)
                                    .foregroundStyle(.lightCyan)
                                Spacer()
                                NavigationLink {
                                    ListGameView()
                                } label: {
                                    Image("pixel_angle-right-solid")
                                        .renderingMode(.template)
                                        .resizable()
                                        .frame(width: 17, height: 17)
                                        .foregroundStyle(.lightCyan)
                                }
                            }
                            
                            VStack(spacing: 16) {
                                GameInfoComponent()
                                GameInfoComponent()
                                GameInfoComponent()
                            }
                        }.padding(.horizontal, 16)
                    }
                }
                
                Spacer()
            }.background(.darkBlue)
        }
    }
}

#Preview {
    MainView()
}
