//
//  Animation.swift
//  dungeons
//
//  Created by Brian Liew on 11/5/21.
//

import Foundation
import UIKit

class Animation {
    
    var view: UIView
    
    init(view: UIView) { self.view = view }
    
    // MARK: animation methods
    
    func transition_y(from: CGFloat, to: CGFloat, duration: Double, new_x: CGFloat, new_y: CGFloat) -> Void {
        let animation = CABasicAnimation()
        
        animation.keyPath = "position.y"
        animation.fromValue = from
        animation.toValue = to
        animation.duration = duration
        
        view.layer.add(animation, forKey: "transition_y")
        view.layer.position = CGPoint(x: new_x, y: new_y)
    }
    
    func scale(from: CGFloat, to: CGFloat, duration: Double) -> Void {
        let animation = CABasicAnimation()
        
        animation.keyPath = "transform.scale"
        animation.fromValue = from
        animation.toValue = to
        animation.duration = duration
        
        view.layer.add(animation, forKey: "scale")
    }
    
    func shake(values: [Int], keyTimes : [NSNumber], duration: Double) -> Void {
        let animation = CAKeyframeAnimation()
        
        animation.keyPath = "position.x"
        animation.values = values
        animation.keyTimes = keyTimes
        animation.duration = duration
        
        view.layer.add(animation, forKey: "shake")
    }
}
