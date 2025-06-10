//
//  DetailGameView.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import SwiftUI
import Flow

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct DetailGameView: View {
    @StateObject var viewModel = DetailGameViewViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { geo in
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
                }
                .frame(height: geo.size.height*0.3)
                
                ScrollView {
                    // Game Info
                    GameInfoComponent(readOnlyComponent: true, name: "Elden Ring", description: "Rating: 4/5").padding(.horizontal, 16)
                    
                    // Description
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                        .font(.custom("VT323-Regular", size: 20))
                        .dynamicTypeSize(.medium ... .accessibility5)
                        .foregroundStyle(.lightCyan)
                        .padding(.horizontal, 16)
                    
                    // Tags
                    VStack(alignment: .leading ,spacing: 12) {
                        Text("Tags")
                            .font(.custom("VT323-Regular", size: 24))
                            .dynamicTypeSize(.medium ... .accessibility5)
                            .foregroundStyle(.lightCyan)
                        HFlow {
                            ForEach(viewModel.tags, id:\.self) {item in
                                Tags(text: item)
                            }
                        }
                    }
                }
                
                Spacer()
            }
        }
        .background(.darkBlue)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    DetailGameView()
}
