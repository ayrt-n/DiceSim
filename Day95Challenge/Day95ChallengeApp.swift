//
//  Day95ChallengeApp.swift
//  Day95Challenge
//
//  Created by Ayrton Parkinson on 2024/08/06.
//

import SwiftData
import SwiftUI

@main
struct Day95ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Roll.self)
    }
}
