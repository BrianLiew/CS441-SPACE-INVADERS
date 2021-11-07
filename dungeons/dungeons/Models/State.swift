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
    var new_x: CGFloat?
    var new_y: CGFloat?
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
        new_x: CGFloat?,
        new_y: CGFloat?,
        A_next_state: State?,
        B_next_state: State?
    ) {
        self.name = name
        self.number = number
        self.dialouge = dialouge
        self.A_text = A_text
        self.B_text = B_text
        
        if let state = A_next_state { self.A_next_state = state }
        if let state = B_next_state { self.B_next_state = state }
    }
        
    // MARK: responses/choices
    // return value used to set ViewController.current_level or ViewController.current_state
    func translation_params() -> (fromValue: CGFloat, toValue: CGFloat, duration: Double, x: CGFloat, y: CGFloat) {
        guard
            let fromValue = self.animate_from,
            let toValue = self.animate_to,
            let duration = self.animate_duration,
            let x = self.new_x,
            let y = self.new_y
        else { fatalError("current_state.get_aniparam() error: invalid animation parameters.\nattempted animation: \(name).translation_y") }
        
        return (fromValue, toValue, duration, x, y)
    }
    
    func scale_params() -> (fromValue: CGFloat, toValue: CGFloat, duration: Double) {
        guard
            let fromValue = self.animate_from,
            let toValue = self.animate_to,
            let duration = self.animate_duration
        else { fatalError("current_state.get_aniparam() error: invalid animation parameters.\nattempted animation: \(name).scale") }
        
        return (fromValue, toValue, duration)
    }
    
    func shake_params() -> (values: [Int], keyTimes : [NSNumber], duration: Double) {
        guard
            let values = self.animate_values,
            let keyTimes = self.animate_keyTimes,
            let duration = self.animate_duration
        else { fatalError("current_state.get_aniparam() error: invalid animation parameters.\nattempted animation: \(name).shake") }
        
        return (values, keyTimes, duration)
    }
    
    // INSERT INCREMENTER HERE
    func load_next_level() {}
    
}
