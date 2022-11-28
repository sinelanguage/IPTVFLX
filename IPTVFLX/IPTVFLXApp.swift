//
//  IPTVFLXApp.swift
//  IPTVFLX
//
//  Created by Adam Winick on 2022-11-27.
//

import SwiftUI

@main
struct IPTVFLXApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
