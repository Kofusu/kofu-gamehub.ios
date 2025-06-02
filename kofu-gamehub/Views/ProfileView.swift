//
//  ProfileView.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import SwiftUI
import Flow

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 17) {
            // Images
            ZStack {
                Image("profile-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: .infinity, height: 214)
                    .clipped()
                Image("pp-pixelated")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(.circle)
                    .offset(x: 0, y: 100)
                // Button di atas kiri pake alignment overlay
                VStack {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image("pixelarticons_arrow-left")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundStyle(.lightCyan)
                        }
                        .accessibilityLabel("Back")
                        .padding()
                        Spacer()
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: 214)
            }
            .padding(.bottom, 76)
            
            // Texts
            VStack(alignment: .center, spacing: 8) {
                Text("Hendratara Pratama")
                    .font(.custom("VT323-Regular", size: 32))
                    .dynamicTypeSize(.xLarge ... .accessibility1)
                    .foregroundStyle(.lightCyan)
                
                Text("Frontend Engineer specializing in Web and Mobile Development. Experienced in building scalable, high-performance applications with a strong focus on Fullstack UI/UX design. Passionate about creating responsive, intuitive, and consistent user interfaces across platforms")
                    .font(.custom("VT323-Regular", size: 17))
                    .dynamicTypeSize(.medium ... .accessibility5)
                    .foregroundStyle(.lightCyan)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 16)
            
            // Sosmed
            HStack(alignment: .center, spacing: 12) {
                ForEach(viewModel.socialMedia) { item in
                    Link(destination: item.url) {
                        Image(item.icon)
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.lightCyan)
                    }
                }
            }
            
            Rectangle()
                .frame(width: .infinity, height: 1)
                .padding(.horizontal, 16)
                .foregroundStyle(.lightCyan)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Interest")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .font(.custom("VT323-Regular", size: 20))
                    .dynamicTypeSize(.medium ... .accessibility4)
                    .foregroundStyle(.lightCyan)
                
                
                HFlow {
                    ForEach(viewModel.interest, id:\.self) {item in
                        Tags(text: item)
                    }
                }
            }
            .padding(.horizontal, 16)
            
            Spacer()
        }
        .background(.darkBlue)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ProfileView()
}
