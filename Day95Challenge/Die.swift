//
//  Die.swift
//  Day95Challenge
//
//  Created by Ayrton Parkinson on 2024/08/07.
//

import Foundation

struct Die: Codable, Equatable, Identifiable {
    let id: UUID
    let sides: Int
    var number: Int
    
    mutating func roll() {
        number = Int.random(in: 1...sides)
    }
    
    static func ==(lhs: Die, rhs: Die) -> Bool {
        return lhs.id == rhs.id
    }
    
    init(sides: Int) {
        self.id = UUID()
        self.sides = sides
        number = Int.random(in: 1...sides)
    }
}
