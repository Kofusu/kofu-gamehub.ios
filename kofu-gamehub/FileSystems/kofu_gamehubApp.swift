//
//  kofu_gamehubApp.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import SwiftUI

@main
struct kofu_gamehubApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .font(.custom("VT323-Regular", size: 16))
                .background(.darkBlue)
        }
    }
}
