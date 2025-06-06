//
//  GameCard.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 04/06/25.
//

import SwiftUI

struct GameCard: View {
    var body: some View {
        NavigationLink {
            DetailGameView()
        } label: {
            VStack(alignment: .leading) {
                ZStack(alignment: .topTrailing) {
                    Image("profile-cover")
                        .resizable()
                        .frame(width: 165, height: 102)
                    HStack(alignment: .center, spacing: 4) {
                        Text("9.8")
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
                Text("Elden Ring")
                    .font(.custom("VT323-Regular", size: 20))
                    .dynamicTypeSize(.medium ... .accessibility5)
                    .foregroundStyle(.lightCyan)
            }
        }
    }
}

#Preview {
    GameCard()
}
