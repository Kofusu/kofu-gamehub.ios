//
//  DetailGameView.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import SwiftUI
import Flow

//struct Triangle: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.closeSubpath()
//        return path
//    }
//} // Coba coba aja ini mah

struct DetailGameView: View {
    let gameId: Int
    
    @StateObject private var viewModel = DetailGameViewViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        GeometryReader { geo in
            if let detailGame = viewModel.gameDetail {
                VStack(spacing: 20) {
                    // Game Image Preview
                    ZStack(alignment: .topLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image("pixelarticons_arrow-left")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundStyle(.lightCyan)
                        }
                        .zIndex(10)
                        .padding(.top, 10)
                        .padding(.leading, 16)
                        
                        Image("profile-cover")
                            .resizable()
                        AsyncImage(url: URL(string: detailGame.backgroundImageAdditional ?? "")) { phase in
                            switch phase {
                            case .empty:
                                // Loading state
                                ProgressView()
                                    .background(Color.gray.opacity(0.3))
                                
                            case .success(let image):
                                image
                                    .resizable()
                                
                            case .failure(_):
                                // Fallback image
                                Image(systemName: "photo.fill")
                                    .resizable()
                                    .foregroundColor(.gray)
                                    .background(Color.gray.opacity(0.2))
                                
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }
                    .frame(height: geo.size.height*0.3)
                    
                    ScrollView {
                        // Game Info
                        GameInfoComponent(id: 1, readOnlyComponent: true, name: detailGame.name, description: "Rating: \(detailGame.rating)", image: URL(string: detailGame.backgroundImage ?? "")).padding(.horizontal, 16)
                        
                        // Description
                        Text(detailGame.description)
                            .font(.custom("VT323-Regular", size: 20))
                            .dynamicTypeSize(.medium ... .accessibility5)
                            .foregroundStyle(.lightCyan)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 16)
                        
                        // Tags
                        VStack(alignment: .leading ,spacing: 12) {
                            Text("Tags")
                                .font(.custom("VT323-Regular", size: 24))
                                .dynamicTypeSize(.medium ... .accessibility5)
                                .foregroundStyle(.lightCyan)
                            HFlow {
                                if let detailTags = detailGame.tags {
                                    ForEach(detailTags) {item in
                                        Tags(text: item.name)
                                    }
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }
            }
        }
        .background(.darkBlue)
        .navigationBarBackButtonHidden()
        .onAppear {
            viewModel.fetchDetailGame(gameId)
        }
    }
}

#Preview {
    DetailGameView(gameId: 1)
}
