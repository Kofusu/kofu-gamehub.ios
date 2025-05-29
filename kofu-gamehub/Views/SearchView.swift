//
//  SearchViewViewModel.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewViewModel()
    var body: some View {
        Text(viewModel.text)
    }
}

#Preview {
    SearchView()
}
