//
//  ContentView.swift
//  Day95Challenge
//
//  Created by Ayrton Parkinson on 2024/08/06.
//

import SwiftUI

struct ContentView: View {
    @State private var dice = [Die(sides: 6), Die(sides: 20), Die(sides: 10)]
    
    var body: some View {
        HStack {
            ForEach(dice) { die in
                DiceView(die: die)
            }
        }
        
        Text("\(dice.reduce(0) { $0 + $1.number })")
        
        Button("Roll") {
            print("The dice were \(dice.map() { $0.number })")
            
            dice = dice.map { Die(sides: $0.sides) }
            
            print("The roll was \(dice.map() { $0.number })")
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

#Preview {
    ContentView()
}
