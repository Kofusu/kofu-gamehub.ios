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
            ZStack {
                Color.darkBlue.ignoresSafeArea(.all)
                
                VStack {
                    // Header
                    NavbarHeader(text: $viewModel.searchText, showMenu: $viewModel.showMenu)
                        .confirmationDialog("MainMenu", isPresented: $viewModel.showMenu) {
                            NavigationLink {
                                ProfileView()
                            } label: {
                                Text("To Profile")
                            }
                        }
                    
                    Text("Hello World!")
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    MainView()
}
