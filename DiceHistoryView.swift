//
//  DiceHistoryView.swift
//  Day95Challenge
//
//  Created by Ayrton Parkinson on 2024/08/09.
//

import SwiftUI
import SwiftData

struct DiceHistoryView: View {
    @Environment(\.modelContext) var modelContext
    @Query var diceHistory: [Dice]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DiceHistoryView()
        .modelContainer(for: Dice.self)
}
