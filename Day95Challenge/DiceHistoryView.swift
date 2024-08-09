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
        NavigationStack {
            List(diceHistory) { roll in
                VStack(alignment: .leading) {
                    HStack {
                        ForEach(roll.diceArray) { dice in
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.white)
                                    .stroke(.black, lineWidth: 2)
                                    .frame(width: 25, height: 25)
                                Text("\(dice.number)")
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                    Text("Total: \(roll.total)")
                        .font(.headline)
                }
            }
            .navigationTitle("Roll History")
        }
    }
}

#Preview {
    DiceHistoryView()
        .modelContainer(for: Dice.self)
}
