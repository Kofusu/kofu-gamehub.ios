//
//  GameInfoComponent.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 05/06/25.
//

import SwiftUI

struct GameInfoComponent: View {
    var id: Int
    var readOnlyComponent: Bool = false
    var name: String
    var description: String
    var image: URL?
    var released: String?
    
    var body: some View {
        if readOnlyComponent  {
            Component
        } else{
            NavigationLink {
                DetailGameView(gameId: id)
            } label: {
                Component
            }
        }
    }
    
    @ViewBuilder
    var Component: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: image) { phase in
                switch phase {
                case .empty:
                    // Loading state
                    ProgressView()
                        .frame(width: 130, height: 80)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(8)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 130, height: 80)
                        .aspectRatio(13/6, contentMode: .fit)
                        .cornerRadius(8)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                case .failure(_):
                    // Fallback image
                    Image(systemName: "photo.fill")
                        .resizable()
                        .frame(width: 130, height: 80)
                        .aspectRatio(13/6, contentMode: .fit)
                        .cornerRadius(8)
                        .foregroundColor(.gray)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(name)
                    .foregroundStyle(.lightCyan)
                    .font(.custom("VT323-Regular", size: 24))
                    .bold()
                    .dynamicTypeSize(.medium ... .accessibility4)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                Text(description)
                    .foregroundStyle(.lightCyan)
                    .font(.custom("VT323-Regular", size: 20))
                    .dynamicTypeSize(.medium ... .accessibility5)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                if let release = released {
                    Text("Released: \(release)")
                        .foregroundStyle(.lightCyan)
                        .font(.custom("VT323-Regular", size: 20))
                        .dynamicTypeSize(.medium ... .accessibility5)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                }
                
                HStack(spacing: 8) {
                    Image("ri_playstation-fill")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.lightCyan)
                    Image("fa6-solid_computer")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.lightCyan)
                    Image("mdi_nintendo-switch")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.lightCyan)
                }
                .opacity(0)
            }
            Spacer()
        }
    }
}
#Preview {
    GameInfoComponent(id: 1, name: "Elden Ring", description: "Rating: 4/5", image: URL(string: "https://images.unsplash.com/photo-1615680022647-99c397cbcaea?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!, released: "2002-05-06")
}
