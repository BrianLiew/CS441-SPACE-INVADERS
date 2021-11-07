//
//  Levels.swift
//  dungeons
//
//  Created by Brian Liew on 11/4/21.
//

import Foundation
import UIKit

class Levels {
    
    static let instance = Levels()
    
    public var levels: [Level]
    
    public var img_view: UIImageView
    
    // MARK: levels & respective states initialization
    init() {
        // MARK: state declaration
        let lvl_0_fail = State (
            name: "Failed: declined entrance decision",
            number: -1,
            dialouge: "Pussies don't get shit done",
            A_text: "...",
            B_text: "Restart?",
            char_img: "",
            animation: nil,
            animate_from: nil,
            animate_to: nil,
            animate_values: nil,
            animate_keyTimes: nil,
            animate_duration: nil,
            new_x: nil,
            new_y: nil,
            A_next_state: nil,
            B_next_state: nil
        )
        let lvl_0_stt_2 = State (
            name: "Entering dungeon decision confirmation",
            number: 2,
            dialouge: "You open the door slightly and hear echos of ghoulish screams. Are you sure you want proceed?",
            A_text: "Fo' sure",
            B_text: "Aw hell nah",
            char_img: "",
            animation: nil,
            animate_from: nil,
            animate_to: nil,
            animate_values: nil,
            animate_keyTimes: nil,
            animate_duration: nil,
            new_x: nil,
            new_y: nil,
            A_next_state: nil,
            B_next_state: lvl_0_fail
        )
        let lvl_0_stt_1 = State (
            name: "Entering dungeon decision confirmation",
            number: 1,
            dialouge: "You open the door slightly and hear echos of ghoulish screams. Are you sure you want proceed?",
            A_text: "Momma ain't raise no bitch",
            B_text: "Aw hell nah",
            char_img: "",
            animation: nil,
            animate_from: nil,
            animate_to: nil,
            animate_values: nil,
            animate_keyTimes: nil,
            animate_duration: nil,
            new_x: nil,
            new_y: nil,
            A_next_state: lvl_0_stt_2,
            B_next_state: lvl_0_fail
        )
        let lvl_0_stt_0 = State (
            name: "Entering dungeon decision",
            number: 0,
            dialouge: "You, for whatever reason, wake up in front of a dungeon. Do you go in?",
            A_text: "Hell yes",
            B_text: "Nah, I'm good",
            char_img: "",
            animation: nil,
            animate_from: nil,
            animate_to: nil,
            animate_values: nil,
            animate_keyTimes: nil,
            animate_duration: nil,
            new_x: nil,
            new_y: nil,
            A_next_state: lvl_0_stt_1,
            B_next_state: lvl_0_fail
        )
        let level_0_states: [State] = [
            lvl_0_stt_0,
            lvl_0_stt_1,
            lvl_0_stt_2,
            lvl_0_fail
        ]
        
        // MARK: level declaration
        let level_0 = Level (
            name: "Dungeon Entrance",
            number: 0,
            states: level_0_states,
            next_level: nil
        )
        
        levels = [
            level_0
        ]
    }
    
    func get_level(number: Int) -> Level? {
        for level in levels { if number == level.number { return level }}
        return nil
    }
    
}
