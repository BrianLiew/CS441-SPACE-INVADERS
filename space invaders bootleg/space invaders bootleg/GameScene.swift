//
//  GameScene.swift
//  space invaders bootleg
//
//  Created by Brian Liew on 11/9/21.
//

import SpriteKit
import GameplayKit
import UIKit

func + (left: CGPoint, right: CGPoint) -> CGPoint { return CGPoint(x: left.x + right.x, y: left.y + right.y) }

func - (left: CGPoint, right: CGPoint) -> CGPoint { return CGPoint(x: left.x - right.x, y: left.y - right.y) }

func *(point: CGPoint, scalar: CGFloat) -> CGPoint { return CGPoint(x: point.x * scalar, y: point.y * scalar) }

func /(point: CGPoint, scalar: CGFloat) -> CGPoint { return CGPoint(x: point.x / scalar, y: point.y / scalar) }

extension CGPoint {
  func length() -> CGFloat { return sqrt(x * x + y * y) }
  func normalized() -> CGPoint { return self / length() }
}

struct Physics_Categories {
    static let none     : UInt32 = 0b000    // 0
    static let enemy    : UInt32 = 0b001    // 1
    static let player   : UInt32 = 0b010    // 2
    static let bullet   : UInt32 = 0b011    // 3
}

class GameScene: SKScene {
    
    private let player = SKSpriteNode(imageNamed: "baxter")
    
    private var lives: Int = 3
    private var score: Int = 0
    
    private let life_label = SKLabelNode(fontNamed: "Chalkduster")
    private let score_label = SKLabelNode(fontNamed: "Chalkduster")
    
    let instance = Singleton.instance
    
    override func didMove(to view: SKView) {
        backgroundColor = pantone342
        
        life_label.text = "Lives: \(lives)"
        life_label.fontSize = 36
        life_label.fontColor = SKColor.white
        life_label.position = CGPoint(x: -screen_width / 2, y: -600)
        
        score_label.text = "Score: \(score)"
        score_label.fontSize = 36
        score_label.fontColor = SKColor.white
        score_label.position = CGPoint(x: screen_width / 2, y: -600)
        
        player.position = CGPoint(x: 0, y: -screen_height / 2)
       
        addChild(life_label)
        addChild(score_label)
        addChild(player)
        
        // SKPhysicsBody: physics
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: player.size.width / 2, height: player.size.height / 2))
        player.physicsBody?.isDynamic = true
        player.physicsBody?.categoryBitMask = Physics_Categories.player
        player.physicsBody?.contactTestBitMask = Physics_Categories.enemy
        player.physicsBody?.collisionBitMask = Physics_Categories.none
        
        run(SKAction.repeatForever(SKAction.sequence([
            SKAction.run(shoot),
            SKAction.wait(forDuration: 0.5)
        ])))
        
        run(SKAction.repeatForever(SKAction.sequence([
            SKAction.run(add_enemy),
            SKAction.wait(forDuration: 0.5)
        ])))
    }
    
    func random(from: Double, to: Double) -> Double { return Double.random(in: (from...to)) }
    
    func update_UI() -> Void {
        life_label.text = "Lives: \(lives)"
        score_label.text = "Score: \(score)"
    }
    
    func shoot() -> Void {
        let bullet = SKSpriteNode(imageNamed: "whiteclaw")
        bullet.position.x = player.position.x
        bullet.position.y = player.position.y * 0.9

        bullet.size.width = player.size.width * 0.5
        bullet.size.height = bullet.size.width
        
        addChild(bullet)
        
        bullet.physicsBody = SKPhysicsBody(circleOfRadius: bullet.size.width / 3)
        bullet.physicsBody?.isDynamic = true
        bullet.physicsBody?.categoryBitMask = Physics_Categories.bullet
        bullet.physicsBody?.contactTestBitMask = Physics_Categories.enemy
        bullet.physicsBody?.collisionBitMask = Physics_Categories.none
        
        let movement = SKAction.moveBy(x: 0, y: screen_height * 2, duration: 2.0)
        let removal = SKAction.removeFromParent()
        bullet.run(SKAction.sequence([movement, removal]))
    }
    
    func add_enemy() {
        // SKSpriteNode: creation
        let enemy = SKSpriteNode(imageNamed: "a+")
        enemy.position = CGPoint(x: CGFloat(random(from: -screen_width / 2, to: screen_width / 2)), y: screen_height)
        addChild(enemy)
        
        // SKPhysicsBody: physics
        enemy.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: enemy.size.width / 2, height: enemy.size.height / 2))
        enemy.physicsBody?.isDynamic = true
        enemy.physicsBody?.categoryBitMask = Physics_Categories.enemy
        enemy.physicsBody?.contactTestBitMask = Physics_Categories.bullet
        enemy.physicsBody?.collisionBitMask = Physics_Categories.none
        
        // SKAction: actions
        let movement = SKAction.move(to: CGPoint(x: CGFloat(random(from: -screen_width / 2, to: screen_width / 2)), y: -screen_height), duration: random(from: 1.0, to: 3.0))
        let removal = SKAction.removeFromParent()
        
        enemy.run(SKAction.sequence([movement, removal]))
    }
        
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let tlocation = touch.location(in: self)
                
        if (tlocation.x < 0 && tlocation.y < screen_height) { player.run(SKAction.moveBy(x: -25, y: 0, duration: 0.5)) }
        else if (tlocation.x > 0 && tlocation.y < screen_height) { player.run(SKAction.moveBy(x: 25, y: 0, duration: 0.5)) }
        /*
        else {
            let bullet = SKSpriteNode(imageNamed: "bullet")
            bullet.position = player.position
            
            let offset = tlocation - bullet.position
            if (offset.y < -screen_height / 2) { return }
            
            // SKPhysicsBody: physics
            bullet.physicsBody = SKPhysicsBody(circleOfRadius: bullet.size.width)
            bullet.physicsBody?.isDynamic = true
            bullet.physicsBody?.categoryBitMask = Physics_Categories.bullet
            bullet.physicsBody?.contactTestBitMask = Physics_Categories.enemy
            bullet.physicsBody?.collisionBitMask = Physics_Categories.none
            
            addChild(bullet)
            
            let direction = offset.normalized()
            let trajectory = direction * 1000
            let destination = trajectory + bullet.position

            // SKAction: action
            let movement = SKAction.move(to: destination, duration: 1.0)
            let removal = SKAction.removeFromParent()
            bullet.run(SKAction.sequence([movement, removal]))
         }
         */
    }
    
    func bullet_collision(enemy: SKSpriteNode, bullet: SKSpriteNode) -> Void {
        // SKSpiritNode: creation
        let explosion = SKSpriteNode(imageNamed: "explosion")
        explosion.position = bullet.position
        addChild(explosion)
                
        // SKAction: action
        let scale = SKAction.scale(by: 1.2, duration: 0.33)
        let removal = SKAction.removeFromParent()
        explosion.run(SKAction.sequence([scale, removal]))
        
        enemy.removeFromParent()
        bullet.removeFromParent()
        
        score += 1
        instance.set_score(score: self.score)
        update_UI()
    }
    
    func player_collision(enemy: SKSpriteNode, player: SKSpriteNode) -> Void {
        // SKSpiritNode: creation
        let explosion = SKSpriteNode(imageNamed: "explosion")
        explosion.position = enemy.position
        addChild(explosion)
                        
        // SKAction: action
        let scale = SKAction.scale(by: 1.2, duration: 0.33)
        let removal = SKAction.removeFromParent()
        let right_shake = SKAction.moveBy(x: 10, y: 0, duration: 0.1)
        let left_shake = SKAction.moveBy(x: -10, y: 0, duration: 0.1)
        
        explosion.run(SKAction.sequence([scale, removal]))
        player.run(SKAction.repeat(SKAction.sequence([right_shake, left_shake, left_shake, right_shake]), count: 3))
                
        enemy.removeFromParent()
        
        lives -= 1
        update_UI()
        
        if (lives < 1) {
            player.removeFromParent()

            if let view = self.view {
                if let scene = SKScene(fileNamed: "GameOverScene") {
                    scene.scaleMode = .aspectFill
                    view.presentScene(scene, transition: SKTransition.flipHorizontal(withDuration: 0.5))
                }
            }
        }
    }

}

extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        var body_A: SKPhysicsBody
        var body_B: SKPhysicsBody
        
        // sort SKPhysicsBody by category
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            body_A = contact.bodyA
            body_B = contact.bodyB
        } else {
            body_A = contact.bodyB
            body_B = contact.bodyA
        }
        
        // check if correct Physics_Category, then collide
        if ((body_A.categoryBitMask == Physics_Categories.enemy) && (body_B.categoryBitMask == Physics_Categories.bullet)) {
            if
                let enemy = body_A.node as? SKSpriteNode,
                let bullet = body_B.node as? SKSpriteNode {
                bullet_collision(enemy: enemy, bullet: bullet)
            }
        }
        else if ((body_A.categoryBitMask == Physics_Categories.enemy) && (body_B.categoryBitMask == Physics_Categories.player)) {
            if
                let enemy = body_A.node as? SKSpriteNode,
                let player = body_B.node as? SKSpriteNode {
                player_collision(enemy: enemy, player: player)
            }
        }
    }
    
}
