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
    let modelContainer: ModelContainer
    init() {
      do {
        modelContainer = try ModelContainer(for: Dice.self)
      } catch {
        fatalError("Could not initialize ModelContainer")
      }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(modelContainer)
    }
}
