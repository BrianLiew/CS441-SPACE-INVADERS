//
//  Animation.swift
//  dungeons
//
//  Created by Brian Liew on 11/5/21.
//

import Foundation
import UIKit

class Animation {
    
    var view: UIImageView
    
    init(view: UIImageView) { self.view = view }
    
    // MARK: animation methods
    
    func translation_y(from: CGFloat, to: CGFloat, duration: Double) -> Void {
        print("lation called")
        let animation = CABasicAnimation()
        
        animation.keyPath = "position.y"
        animation.fromValue = from
        animation.toValue = to
        animation.duration = duration
        
        view.layer.add(animation, forKey: "translation_y")
        view.layer.position = CGPoint(x: view.layer.position.x, y: to)
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
