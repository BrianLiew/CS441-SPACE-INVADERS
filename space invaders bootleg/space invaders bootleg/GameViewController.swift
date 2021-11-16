//
//  GameViewController.swift
//  space invaders bootleg
//
//  Created by Brian Liew on 11/9/21.
//

import UIKit
import SpriteKit
import GameplayKit

public let screen_width = UIScreen.main.bounds.width
public let screen_height = UIScreen.main.bounds.height

public let pantone342 = SKColor.init(red: 0, green: 0.42, blue: 0.33, alpha: 0)

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameStartScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
