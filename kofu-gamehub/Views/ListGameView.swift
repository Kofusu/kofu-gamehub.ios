//
//  ListGameView.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import SwiftUI

struct ListGameView: View {
    @StateObject var viewModel = ListGameViewViewModel()
    var body: some View {
        VStack {
            NavbarHeader(text: $viewModel.text, showMenu: $viewModel.showMenu, hasBack: true)
            
            ScrollView {
                GameInfoComponent(name: "Elden Ring", description: "Rating: 4/5")
                GameInfoComponent(name: "Elden Ring", description: "Rating: 4/5")
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            
            Spacer()
        }
        .background(.darkBlue)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ListGameView()
}
