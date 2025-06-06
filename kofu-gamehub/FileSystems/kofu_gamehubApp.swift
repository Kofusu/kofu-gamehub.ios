//
//  kofu_gamehubApp.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import SwiftUI

@main
struct kofu_gamehubApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .font(.custom("VT323-Regular", size: 16))
                .background(.darkBlue)
        }
    }
}
