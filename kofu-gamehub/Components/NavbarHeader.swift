//
//  NavbarHeader.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 01/06/25.
//

import SwiftUI

struct NavbarHeader: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var text: String
    @Binding var showMenu: Bool
    
    var hasSearch = false
    
    var body: some View {
        HStack {
            Button {
                if hasSearch {
                    dismiss()
                } else {
                    showMenu = !showMenu
                }
            } label: {
                Image(hasSearch ? "pixelarticons_arrow-left": "pixel_bars")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            .accessibilityLabel(hasSearch ? "Back" : "Menu")
            
            Spacer()
            
            if hasSearch {
                TextField(text: $text) {
                    Text("Search Game")
                        .foregroundStyle(.lightCyan)
                }
                .submitLabel(.search)
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .foregroundStyle(.lightCyan)
                .background {
                    RoundedRectangle(cornerRadius: 4)
                        .foregroundStyle(.darkBlue)
                }
                .padding(.horizontal, 16)
                .font(.custom("VT323-Regular", size: 20))
            } else {
                Text("Kofu GameHub")
                    .accessibilityAddTraits(.isHeader)
                    .font(.custom("VT323-Regular", size: 20))
            }
            
            Spacer()
            
            Button{
                
            } label: {
                Image("pixel_search")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 22, height: 22)
            }
            .submitLabel(.search)
        }
        .foregroundStyle(.lightCyan)
        .padding(16)
        .background(.darkCyan)
    }
}

#Preview {
    @Previewable @State var text = ""
    @Previewable @State var showMenu = false

    NavbarHeader(text:$text, showMenu: $showMenu)
}
