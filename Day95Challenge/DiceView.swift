//
//  DiceView.swift
//  Day95Challenge
//
//  Created by Ayrton Parkinson on 2024/08/07.
//

import SwiftUI
import SwiftData

struct DiceView: View {
    @Bindable var die: Die
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .stroke(.black, lineWidth: 3)
            Text("\(die.number)")
                .font(.headline)
        }
        .frame(width: 60, height: 60)
        .onTapGesture {
            die.roll()
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Die.self, configurations: config)
    
    var d6 = Die(sides: 6)
    return DiceView(die: d6)
        .modelContainer(for: Die.self)
}
