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
                    
                    Text("Hello World!")
                        .font(.custom("VT323-Regular", size: 32))
                        .dynamicTypeSize(.xLarge ... .accessibility1)
                        .foregroundStyle(.lightCyan)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    MainView()
}
