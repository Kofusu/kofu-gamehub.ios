//
//  LikesView.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 16/06/25.
//

import SwiftUI

struct LikesView: View {
    @StateObject var viewModel =  LikesViewViewModel()
    
    var body: some View {
        VStack {
            NavbarHeader(text: $viewModel.text, showMenu: $viewModel.showMenu, hasBack: true)
            
            HStack {
                Text("Like you've made")
                    .foregroundStyle(.lightCyan)
                    .font(.custom("VT323-Regular", size: 24))
                    .bold()
                    .dynamicTypeSize(.medium ... .accessibility4)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                
                Spacer()
            }
            .padding(16)
            
            ScrollView {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 40)
                } else if let gameResult = viewModel.games {
                    ForEach(gameResult.results) { result in
                        GameInfoComponent(
                            id: result.id,
                            name: result.name,
                            description: "Rating: \(String(result.rating))",
                            image: URL(string: result.backgroundImage ?? ""),
                            released: result.released ?? "-"
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
    }
}

#Preview {
    LikesView()
}
