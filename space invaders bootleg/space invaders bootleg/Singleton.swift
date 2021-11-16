//
//  singleton.swift
//  space invaders bootleg
//
//  Created by Brian Liew on 11/15/21.
//

import Foundation

class Singleton {
    
    static let instance = Singleton()
    
    var score: Int = 0;
    
    func set_score(score: Int) -> Void { self.score = score }
    
    func get_score() -> Int { return score }
    
}
