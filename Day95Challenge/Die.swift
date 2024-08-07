//
//  Die.swift
//  Day95Challenge
//
//  Created by Ayrton Parkinson on 2024/08/07.
//

import Foundation

@Observable
class Die: Identifiable {
    let id: UUID
    let sides: Int
    var number: Int
    
    func roll() {
        number = Int.random(in: 1...sides)
    }
    
    init(sides: Int) {
        self.id = UUID()
        self.sides = sides
        number = Int.random(in: 1...sides)
    }
}
