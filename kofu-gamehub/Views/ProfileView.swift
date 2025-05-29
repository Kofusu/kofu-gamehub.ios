//
//  ProfileView.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) var dissmiss
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        Text(viewModel.text)
        Button("Dissmiss") {
            dissmiss()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ProfileView()
}
