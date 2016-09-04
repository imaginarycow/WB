//
//  GameViewController.swift
//  WordBomb
//
//  Created by ramiro beltran on 9/3/16.
//  Copyright (c) 2016 Ramiro Beltran. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    var scene: SKScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scene = MenuScene()
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        scene.size = skView.bounds.size
        
        skView.presentScene(scene)
        
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .Landscape
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
