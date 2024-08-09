//
//  DiceRollView.swift
//  Day95Challenge
//
//  Created by Ayrton Parkinson on 2024/08/09.
//

import SwiftUI

struct DiceRollView: View {
    @Environment(\.modelContext) var modelContext
    @State private var dice: Dice
    @State private var rollingDice = false
    @State private var diceTime = 10
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    ForEach(dice.diceArray) { die in
                        DiceView(die: die)
                    }
                }
                
                HStack {
                    Text("Roll Total: ")
                    Text("\(dice.total)")
                        .frame(width: 30)
                }
                .font(.headline)
                .padding(.vertical)

                Button(action: rollDice) {
                    Text("Roll Dice")
                        .frame(width: 150)
                }
                .buttonStyle(.borderedProminent)
                .disabled(rollingDice)
                .sensoryFeedback(.selection, trigger: rollingDice)
            }
            .toolbar {
                NavigationLink() {
                    EditDiceView(dice: dice)
                } label: {
                    Label("Edit", systemImage: "gearshape")
                }
            }
            .onReceive(timer) { _ in
                guard rollingDice else { return }
                
                dice.rollDice()
                diceTime -= 1
                
                if diceTime <= 0 {
                    modelContext.insert(dice)
                    resetDice()
                }
            }
        }
    }

    init() {
        _dice = State(initialValue: Dice(diceArray: [Die(sides: 6), Die(sides: 20), Die(sides: 10)]))
    }
    
    func rollDice() {
        rollingDice = true
    }
    
    func resetDice() {
        let newDice = Dice(diceArray: dice.diceArray)
        dice = newDice
        
        rollingDice = false
        diceTime = 10
    }
}

#Preview {
    DiceRollView()
}
