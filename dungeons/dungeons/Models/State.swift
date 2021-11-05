//
//  State.swift
//  dungeons
//
//  Created by Brian Liew on 11/4/21.
//

import Foundation
import UIKit

class State {
    
    // MARK: variable declarations
    var name: String
    var number: Double
    var dialouge: String
    var A_text: String
    var B_text: String
    var char_img: String?
    // animation
    var animation: String?
    var animate_from: CGFloat?
    var animate_to: CGFloat?
    var animate_values: [Int]?
    var animate_keyTimes: [NSNumber]?
    var animate_duration: CGFloat?
    
    var A_next_state: State?
    var B_next_state: State?
    
    // MARK: initialization
    
    init(
        name: String,
        number: Double,
        dialouge: String,
        A_text: String,
        B_text: String,
        char_img: String?,
        animation: String?,
        animate_from: CGFloat?,
        animate_to: CGFloat?,
        animate_values: [Int]?,
        animate_keyTimes: [NSNumber]?,
        animate_duration: CGFloat?,
        A_next_state: State?,
        B_next_state: State?
    ) {
        self.name = name
        self.number = number
        self.dialouge = dialouge
        self.A_text = A_text
        self.B_text = B_text
        
        if let state = A_next_state { self.A_next_state = state}
        if let state = B_next_state {
            self.B_next_state = state
        }
    }
        
    // MARK: responses/choices
    // return value used to set ViewController.current_level or ViewController.current_state
    
    // INSERT INCREMENTER HERE
    func load_next_level() {}
    
}
