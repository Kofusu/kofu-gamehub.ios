//
//  GameCard.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 04/06/25.
//

import SwiftUI

struct GameCard: View {
    let imageURL: URL
    let rating: Float16
    let name: String
    
    var body: some View {
        NavigationLink {
            DetailGameView()
        } label: {
            VStack(alignment: .leading) {
                ZStack(alignment: .topTrailing) {
                    AsyncImage(url: imageURL) { phase in
                        switch phase {
                        case .empty:
                            // Loading state
                            ProgressView()
                                .frame(width: 165, height: 102)
                                .background(Color.gray.opacity(0.3))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                        case .success(let image):
                            image
                                .resizable()
                                .frame(width: 165, height: 102)
                            
                        case .failure(_):
                            // Fallback image
                            Image(systemName: "photo.fill")
                                .resizable()
                                .frame(width: 165, height: 102)
                            
                        @unknown default:
                            EmptyView()
                        }
                        
                    }
                    HStack(alignment: .center, spacing: 4) {
                        Text(String(rating))
                            .font(.custom("VT323-Regular", size: 17))
                            .dynamicTypeSize(.medium ... .accessibility5)
                            .foregroundStyle(.lightCyan)
                        Image("pixel_star-solid")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 16, height: 16)
                            .foregroundStyle(.lightCyan)
                    }
                    .padding(.top, 4)
                    .padding(.trailing, 4)
                }
                Text(name)
                    .lineLimit(1)
                    .multilineTextAlignment(.leading)
                    .frame(width: 165)
                    .font(.custom("VT323-Regular", size: 20))
                    .dynamicTypeSize(.medium ... .accessibility5)
                    .foregroundStyle(.lightCyan)
            }
        }
    }
}

#Preview {
    GameCard(imageURL: URL(string: "https://media.rawg.io/media/games/46d/46d98e6910fbc0706e2948a7cc9b10c5.jpg")!, rating: 4.5, name: "Elden Ring")
}
