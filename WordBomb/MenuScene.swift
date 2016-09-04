//
//  MenuScene.swift
//  WordBomb
//
//  Created by ramiro beltran on 9/3/16.
//  Copyright © 2016 Ramiro Beltran. All rights reserved.
//

import SpriteKit

let vc = GameViewController()
let iconSize = CGSize(width: 50.0 * scale, height: 50.0 * scale)

class MenuScene: SKScene {
    
    let settingsButton = SKLabelNode(text: "Settings")
    let helpButton = SKLabelNode(text: "Help")
    let playButton = SKLabelNode(text: "Play")
    
    override func didMoveToView(view: SKView) {
        
        createBackground()
        createButtons()
    }
    
    func createButtons() {
        
        let buttonZ:CGFloat = 10.0
        let fontSize = 18.0 * scale
        let color = SKColor.redColor()
        
        settingsButton.zPosition = buttonZ
        settingsButton.fontSize = fontSize
        settingsButton.fontColor = color
        settingsButton.position = CGPoint(x: ((scene?.size.width)! * 0.22), y: scene!.size.height * 0.68)
        addChild(settingsButton)
        
        helpButton.zPosition = buttonZ
        helpButton.fontSize = fontSize
        helpButton.fontColor = color
        helpButton.position = CGPoint(x: ((scene?.size.width)! * 0.22), y: scene!.size.height * 0.55)
        addChild(helpButton)
        
        playButton.zPosition = buttonZ
        playButton.fontSize = fontSize
        playButton.fontColor = color
        playButton.position = CGPoint(x: ((scene?.size.width)! * 0.22), y: scene!.size.height * 0.42)
        addChild(playButton)

    }
    
    func createBackground() {
        
        let bg = SKSpriteNode(imageNamed: "bombImg.png")
        bg.position = CGPoint(x: scene!.size.width/2, y: (scene?.size.height)!/2)
        bg.zPosition = 1
        bg.size = CGSize(width: (scene?.size.width)! * 1.3, height: (scene?.size.height)! * 1.3)
        addChild(bg)
        
        let display = SKSpriteNode(imageNamed: "display.png")
        let displayWidth = scene!.size.width * 0.75
        let displayHeight = scene!.size.height * 0.6
        display.size = CGSize(width: displayWidth, height: displayHeight)
        display.position = CGPoint(x: scene!.size.width/2, y: (scene?.size.height)!/2)
        display.zPosition = 2
        addChild(display)
        
        let timerFrame = SKSpriteNode(imageNamed: "timerFrame.png")
        timerFrame.zPosition = 2
        timerFrame.size = CGSize(width: (scene?.size.width)! * 0.5, height: (scene?.size.height)! * 0.2)
        timerFrame.position = CGPoint(x: scene!.size.width/2, y: (scene?.size.height)! * 0.9)
        addChild(timerFrame)
        
        let timer = SKLabelNode(text: "00:00")
        timer.fontColor = .redColor()
        timer.fontSize = 24.0 * scale
        timer.position = CGPoint(x: scene!.size.width/2, y: (scene?.size.height)! * 0.9)
        timer.zPosition = 3
        addChild(timer)
    }
    
    //set scale of game based on screen size of player's device
    func setScale() {
        screenHeight = scene!.size.height
        screenWidth = scene!.size.width
        print(screenHeight)
        print(screenWidth)
        
        switch screenHeight {
        case 320:
            scale = 1.0
        case 375:
            scale = 1.25
        case 414:
            scale = 1.35
        case 768:
            scale = 1.75
        case 1024:
            scale = 2.0
        default:
            scale = 1.0
        }

    }

    
} //Mark: End MenuScene
