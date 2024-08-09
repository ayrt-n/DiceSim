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
    @State private var dice: Dice
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    ForEach(dice.diceArray) { die in
                        DiceView(die: die)
                    }
                }
                
                Text("Roll Total: \(dice.total)")
                    .font(.headline)
                    .padding(.vertical)
                
                Button(action: dice.rollDice) {
                    Text("Roll Dice")
                        .frame(width: 150)
                }
                .buttonStyle(.borderedProminent)
            }
            .toolbar {
                NavigationLink() {
                    EditDiceView(dice: dice)
                } label: {
                    Label("Edit dice", systemImage: "dice")
                }
            }
        }
    }
    
    init() {
        _dice = State(initialValue: Dice(diceArray: [Die(sides: 6), Die(sides: 20), Die(sides: 10)]))
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Dice.self, configurations: config)
    
    return ContentView()
        .modelContainer(for: Dice.self)
}
