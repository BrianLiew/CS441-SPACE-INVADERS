//
//  Level.swift
//  dungeons
//
//  Created by Brian Liew on 11/4/21.
//

import Foundation

class Level {

    // MARK: variable declarations
    let name: String
    let number: Int
    var states: [State]
    var next_level: Level?
    
    // MARK: initializer
    init(
        name: String,
        number: Int,
        states: [State],
        next_level: Level?
    ) {
        self.name = name
        self.number = number
        self.states = states
        if let level = next_level { self.next_level = level }
    }
    
}
