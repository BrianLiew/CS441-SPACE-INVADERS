//
//  Levels.swift
//  dungeons
//
//  Created by Brian Liew on 11/4/21.
//

import Foundation

class Levels {
    
    static let instance = Levels()
    
    public var levels: [Level]
    
    // MARK: levels & respective states initialization
    init() {
        // MARK: state declaration
        let level_1_fail = State (
            name: "Failed: declined entrance decision",
            number: -1,
            dialouge: "How unremarkable...",
            A_text: "...",
            B_text: "...",
            char_img: "",
            animation: nil,
            animate_from: nil,
            animate_to: nil,
            animate_values: nil,
            animate_keyTimes: nil,
            animate_duration: nil,
            A_next_state: nil,
            B_next_state: nil
        )
        let level_1_welcome_2 = State (
            name: "Welcome dialogue 2",
            number: 1,
            dialouge: "What is that thing?",
            A_text: "...",
            B_text: "...",
            char_img: "",
            animation: nil,
            animate_from: nil,
            animate_to: nil,
            animate_values: nil,
            animate_keyTimes: nil,
            animate_duration: nil,
            A_next_state: nil,
            B_next_state: nil
        )
        let level_1_welcome_1 = State (
            name: "Welcome dialogue 1",
            number: 0,
            dialouge: "Hello...?",
            A_text: "...",
            B_text: "...",
            char_img: "",
            animation: nil,
            animate_from: nil,
            animate_to: nil,
            animate_values: nil,
            animate_keyTimes: nil,
            animate_duration: nil,
            A_next_state: level_1_welcome_2,
            B_next_state: level_1_welcome_2
        )
        let level_1_states: [State] = [
            level_1_welcome_1,
            level_1_fail,
        ]
        // MARK: level declaration
        let level_1 = Level (
            name: "Dungeon Entrance",
            number: 0,
            states: level_1_states,
            next_level: nil
        )
        
        levels = [
            level_1
        ]
    }
    
    func get_level(number: Int) -> Level? {
        for level in levels { if number == level.number { return level }}
        return nil
    }
    
}
