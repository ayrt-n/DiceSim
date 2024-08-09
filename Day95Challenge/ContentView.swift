//
//  ContentView.swift
//  Day95Challenge
//
//  Created by Ayrton Parkinson on 2024/08/06.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            DiceRollView()
                .tabItem {
                    Label("Roll Dice", systemImage: "dice")
                }
            
            DiceHistoryView()
                .tabItem {
                    Label("Roll History", systemImage: "arrow.counterclockwise")
                }
        }
    }
}

#Preview {
    return ContentView()
        .modelContainer(for: Dice.self)
}
