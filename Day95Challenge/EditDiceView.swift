//
//  EditDiceView.swift
//  Day95Challenge
//
//  Created by Ayrton Parkinson on 2024/08/08.
//

import SwiftUI
import SwiftData

struct EditDiceView: View {
    @Bindable var dice: Dice
    @State private var sides = 6
    let sideOptions = [4, 6, 8, 10, 12, 20]
    
    var body: some View {
        Form {
            Section("Existing dice") {
                List {
                    ForEach(dice.diceArray) { die in
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.white)
                                    .stroke(.black, lineWidth: 2)
                                    .frame(width: 25, height: 25)
                                Text("\(die.sides)")
                            }
                        }
                    }
                    .onDelete(perform: dice.removeDice)
                }
                
            }
            
            Section("Add new dice") {
                Picker("Number of sides", selection: $sides) {
                    ForEach(sideOptions, id: \.self) { num in
                        Text("\(num)")
                    }
                }
                Button("Add") { dice.addDice(die: Die(sides: sides)) }
            }
        }
        .navigationTitle("Edit dice")
        .toolbar {
            EditButton()
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Dice.self, configurations: config)
    var dice = Dice(diceArray: [Die(sides: 6)])
    
    return EditDiceView(dice: dice)
        .modelContainer(for: Dice.self)
}
