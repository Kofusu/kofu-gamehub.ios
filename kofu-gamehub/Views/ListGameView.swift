//
//  ListGameView.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import SwiftUI

struct ListGameView: View {
    var ordering: GameListOrdering
    var sorting: GameListSort
    @StateObject private var viewModel = ListGameViewViewModel()
    
    var body: some View {
        VStack {
            NavbarHeader(text: $viewModel.text, showMenu: $viewModel.showMenu, hasBack: true)
            
            HStack {
                Text("Game List")
                    .foregroundStyle(.lightCyan)
                    .font(.custom("VT323-Regular", size: 24))
                    .bold()
                    .dynamicTypeSize(.medium ... .accessibility4)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                
                Spacer()
                
                Button {
                    viewModel.updateOrderingAndSorting(ordering: ordering, sorting: viewModel.sorting == .desc ? .asc : .desc)
                } label: {
                    Image(viewModel.sorting == .desc  ? "pixel_filter-solid" : "pixel_filter")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.lightCyan)
                }
            }
            .padding(16)
            
            ScrollView {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 40)
                } else if let gameResult = viewModel.listGame {
                    ForEach(gameResult.results) { result in
                        GameInfoComponent(
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
            viewModel.text = "Kofu GameHub"
            viewModel.updateOrderingAndSorting(ordering: ordering, sorting: sorting)
        }
    }
}

#Preview {
    ListGameView(ordering: .popular, sorting: .desc)
}
