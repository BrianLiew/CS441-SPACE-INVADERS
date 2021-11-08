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
    var dialogue: String
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
        dialogue: String,
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
        self.dialogue = dialogue
        self.A_text = A_text
        self.B_text = B_text
        
        if let img = char_img { self.char_img = img }
        if let animation_str = animation { self.animation = animation_str }
        if let fromValue = animate_from { self.animate_from = fromValue }
        if let toValue = animate_to { self.animate_to = toValue }
        if let values = animate_values { self.animate_values = values }
        if let keyTimes = animate_keyTimes { self.animate_keyTimes = keyTimes }
        if let duration = animate_duration { self.animate_duration = duration }
        if let state = A_next_state { self.A_next_state = state }
        if let state = B_next_state { self.B_next_state = state }
    }
        
    // MARK: responses/choices
    // return value used to set ViewController.current_level or ViewController.current_state
    func translation_params() -> (fromValue: CGFloat, toValue: CGFloat, duration: Double) {
        guard
            let fromValue = self.animate_from,
            let toValue = self.animate_to,
            let duration = self.animate_duration
        else { fatalError("current_state.translation_params() error: invalid animation parameters.\nattempted animation: \(self.name).translation_y") }
        
        print(fromValue)
        return (fromValue, toValue, duration)
    }
    
    func scale_params() -> (fromValue: CGFloat, toValue: CGFloat, duration: Double) {
        guard
            let fromValue = self.animate_from,
            let toValue = self.animate_to,
            let duration = self.animate_duration
        else { fatalError("current_state.scale_params() error: invalid animation parameters.\nattempted animation: \(name).scale") }
        
        return (fromValue, toValue, duration)
    }
    
    func shake_params() -> (values: [Int], keyTimes : [NSNumber], duration: Double) {
        guard
            let values = self.animate_values,
            let keyTimes = self.animate_keyTimes,
            let duration = self.animate_duration
        else { fatalError("current_state.shake_params() error: invalid animation parameters.\nattempted animation: \(name).shake") }
        
        return (values, keyTimes, duration)
    }
    
    // INSERT INCREMENTER HERE
    func load_next_level() {}
    
}
