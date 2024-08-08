//
//  ContentView.swift
//  Day95Challenge
//
//  Created by Ayrton Parkinson on 2024/08/06.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var dice = Dice(diceArray: [Die(sides: 6), Die(sides: 20), Die(sides: 10)])
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    ForEach(dice.diceArray) { die in
                        DiceView(die: die)
                    }
                }
                
                Text("\(dice.total)")
                
                Button("Roll") {
                    dice.rollDice()
                }
                Button("Add dice") {
                    dice.addDice(die: Die(sides: 6))
                }
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Dice.self, configurations: config)
    
    return ContentView()
        .modelContainer(for: Dice.self)
}
