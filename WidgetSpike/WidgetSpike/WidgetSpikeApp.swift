//
//  WidgetSpikeApp.swift
//  WidgetSpike
//
//  Created by alexis on 16/03/21.
//

import SwiftUI

@main
struct WidgetSpikeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
