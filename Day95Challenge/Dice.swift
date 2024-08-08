//
//  Roll.swift
//  Day95Challenge
//
//  Created by Ayrton Parkinson on 2024/08/07.
//

import Foundation
import SwiftData

@Model
class Dice {
    var diceArray: [Die]
    
    var total: Int {
        diceArray.reduce(0) { $0 + $1.number }
    }
    
    func rollDice() {
        (0..<diceArray.count).forEach { i in
            diceArray[i].roll()
        }
    }
    
    func addDice(die: Die) {
        diceArray.append(die)
    }
    
    func removeDice(at offsets: IndexSet) {
        diceArray.remove(atOffsets: offsets)
    }
    
    init(diceArray: [Die]) {
        self.diceArray = diceArray
    }
}
