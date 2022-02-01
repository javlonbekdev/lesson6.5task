//
//  lesson6_5taskApp.swift
//  lesson6.5task
//
//  Created by Javlonbek on 01/02/22.
//

import SwiftUI

@main
struct lesson6_5taskApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
