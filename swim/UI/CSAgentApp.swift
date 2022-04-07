//
//  ConsciousAgentApp.swift
//  CSAgent
//
//  Created by Adel Chaibi on 01/03/2022.
//

import SwiftUI

@main
struct CSAgentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

