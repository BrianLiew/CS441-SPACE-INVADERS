//
//  GameOverScene.swift
//  space invaders bootleg
//
//  Created by Brian Liew on 11/10/21.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    let label = SKLabelNode(fontNamed: "Chalkduster")
    let score_label = SKLabelNode(fontNamed: "Chalkduster")
    let sublabel = SKLabelNode(fontNamed: "Chalkduster")
    
    let instance = Singleton.instance
    
    override func didMove(to view: SKView) {
        backgroundColor = pantone342
        
        label.text = "GAME OVER"
        label.fontSize = 48
        label.fontColor = SKColor.white
        label.position = CGPoint(x: 0, y: 200)
        
        score_label.text = "SCORE: \(instance.get_score())"
        score_label.fontSize = 36
        score_label.fontColor = SKColor.white
        score_label.position = CGPoint(x: 0, y: 0)
        
        sublabel.text = "TAP ANYWHERE"
        sublabel.fontSize = 36
        sublabel.fontColor = SKColor.white
        sublabel.position = CGPoint(x: 0, y: -200)
        
        addChild(label)
        addChild(score_label)
        addChild(sublabel)
        
        let fadeout = SKAction.fadeOut(withDuration: 0.5)
        let fadein = SKAction.fadeIn(withDuration: 0.5)
        sublabel.run(SKAction.repeatForever(SKAction.sequence([fadeout, fadein])))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let view = self.view {
            if let scene = SKScene(fileNamed: "GameScene") {
                scene.scaleMode = .aspectFill
                view.presentScene(scene, transition: SKTransition.flipHorizontal(withDuration: 0.5))
            }
        }
    }
    
}
