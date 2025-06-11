//
//  SearchViewViewModel.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = ListGameViewViewModel(hasSearch: true)
    var body: some View {
        VStack {
            NavbarHeader(text: $viewModel.text, showMenu: $viewModel.showMenu, hasSearch: true)
            ScrollView {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 40)
                } else if let gameResult = viewModel.listGame {
                    ForEach(gameResult.results) { result in
                        GameInfoComponent(
                            id: result.id,
                            name: result.name,
                            description: "Rating: \(String(result.rating))",
                            image: URL(string: result.backgroundImage ?? "")
                        )
                    }
                } else {
                    Text("No data found.")
                        .foregroundStyle(.white)
                        .padding(.top, 40)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            
            Spacer()
        }
        .background(.darkBlue)
        .navigationBarBackButtonHidden()
        .onAppear {
            viewModel.updateOrderingAndSorting(ordering: .popular, sorting: .desc)
        }
    }
}

#Preview {
    SearchView()
}
