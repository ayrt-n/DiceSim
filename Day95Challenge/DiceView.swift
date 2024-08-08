//
//  DiceView.swift
//  Day95Challenge
//
//  Created by Ayrton Parkinson on 2024/08/07.
//

import SwiftUI
import SwiftData

struct DiceView: View {
    var die: Die
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .stroke(.black, lineWidth: 3)
            Text("\(die.number)")
                .font(.headline)
                .foregroundStyle(.black)
        }
        .frame(width: 60, height: 60)
    }
}

#Preview {
    let d6 = Die(sides: 6)
    return DiceView(die: d6)
}
