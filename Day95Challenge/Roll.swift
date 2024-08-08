//
//  Roll.swift
//  Day95Challenge
//
//  Created by Ayrton Parkinson on 2024/08/07.
//

import Foundation
import SwiftData

@Model
class Roll {
    var dice: [Die]
    
    var total: Int {
        dice.reduce(0) { $0 + $1.number }
    }
    
    init(dice: [Die]) {
        self.dice = dice
    }
}
