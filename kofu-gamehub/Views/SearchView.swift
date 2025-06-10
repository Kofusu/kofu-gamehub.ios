//
//  SearchViewViewModel.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewViewModel()
    var body: some View {
        VStack {
            NavbarHeader(text: $viewModel.text, showMenu: $viewModel.showMenu, hasSearch: true)
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
    SearchView()
}
