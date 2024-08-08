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
    @State private var dice = [Die(sides: 6), Die(sides: 20), Die(sides: 10)]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    ForEach(dice) { die in
                        DiceView(die: die)
                    }
                }
                
                Text("\(dice.reduce(0) { $0 + $1.number })")
                
                Button("Roll") {
                    dice = dice.map { Die(sides: $0.sides) }
                    
                    let roll = Roll(dice: dice)
                    modelContext.insert(roll)
                }
                Button("Add dice") {
                    dice.append(Die(sides: 6))
                }
                Button("Remove dice") {
                    if dice.isEmpty { return }
                    
                    dice.removeFirst()
                }
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Roll.self, configurations: config)
    
    return ContentView()
        .modelContainer(for: Roll.self)
}
