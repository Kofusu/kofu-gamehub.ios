//
//  GameInfoComponent.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 05/06/25.
//

import SwiftUI

struct GameInfoComponent: View {
    var readOnlyComponent: Bool = false
    
    var body: some View {
        if readOnlyComponent  {
            Component
        } else{
            NavigationLink {
                DetailGameView()
            } label: {
                Component
            }
        }
    }
    
    @ViewBuilder
    var Component: some View {
        HStack(alignment: .top, spacing: 16) {
            Image("profile-cover")
                .resizable()
                .frame(width: 130)
                .aspectRatio(13/6, contentMode: .fit)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 6) {
                Text("Elden Ring")
                    .foregroundStyle(.lightCyan)
                    .font(.custom("VT323-Regular", size: 28))
                    .bold()
                    .dynamicTypeSize(.medium ... .accessibility5)
                Text("Rating: 9.8")
                    .foregroundStyle(.lightCyan)
                    .font(.custom("VT323-Regular", size: 20))
                    .dynamicTypeSize(.medium ... .accessibility5)
                
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
            }
            Spacer()
        }
    }
}

#Preview {
    GameInfoComponent()
}
