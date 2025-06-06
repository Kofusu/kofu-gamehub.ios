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
                GameInfoComponent()
                GameInfoComponent()
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
