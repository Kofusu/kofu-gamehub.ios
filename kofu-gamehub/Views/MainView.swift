//
//  ContentView.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        NavigationStack {
            Text(viewModel.text)
                .font(.custom("VT323-Regular", size: 17))
            NavigationLink {
                ProfileView()
            } label: {
                Text("To Profile")
            }
        }
    }
}

#Preview {
    MainView()
}
