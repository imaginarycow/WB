//
//  MenuScene.swift
//  WordBomb
//
//  Created by ramiro beltran on 9/3/16.
//  Copyright © 2016 Ramiro Beltran. All rights reserved.
//

import SpriteKit

let vc = GameViewController()

class MenuScene: SKScene {
    
    let display = SKSpriteNode(imageNamed: "display.png")
    let settingsButton = SKLabelNode(text: "Settings")
    let helpButton = SKLabelNode(text: "Help")
    let playButton = SKLabelNode(text: "Play")
    var animationIndex = 0
    
    override func didMoveToView(view: SKView) {
        
        createBackground()
        createButtons()
        createLettersByIndex()
    }
    
    func createLettersByIndex() {
        
        let fadeIn = SKAction.fadeAlphaTo(1.0, duration: 1.0)
        let fadeOut = SKAction.fadeAlphaTo(0.0, duration: 1.0)
        
        runAction(SKAction.repeatActionForever(SKAction.sequence([
            SKAction.runBlock( {
                self.removeLetters()
                self.createLetters()
                self.animationIndex += 1
            }),
            SKAction.waitForDuration(2.0)
            
            ])))
        
    }
    
    func removeLetters() {
        
        self.enumerateChildNodesWithName("parent", usingBlock: { (node, stop) -> Void in
            if node.name == "parent" {
                node.removeFromParent()
            }
        })
        display.enumerateChildNodesWithName("letterBox", usingBlock: { (node, stop) -> Void in
            if node.name == "letterBox" {
                node.removeFromParent()
            }
        })
    }
    
    func createLetters() {
        
        let parent = SKSpriteNode(color: SKColor.darkGrayColor(), size: CGSize(width: scene!.size.width * 0.63, height: 50.0 * scale))
        parent.position = CGPoint(x: scene!.size.width/2, y: (scene?.size.height)!/2)
        parent.zPosition = 3
        parent.name = "parent"
        addChild(parent)
        
        let boxWidth = parent.size.width/8
        let boxSize = CGSize(width: boxWidth, height: boxWidth)
        let anchorPoint = CGPoint(x: 0.0 - parent.size.width/2 + (boxSize.width/2), y: 0.0 + boxSize.height/2)
        for i in 0...7 {
            let letterBox = SKSpriteNode(imageNamed: "letterBox.png")
            letterBox.name = "letterBox"
            letterBox.zPosition = 4
            letterBox.position = CGPoint(x: anchorPoint.x + (boxSize.width * CGFloat(i)), y: 0.0)
            letterBox.size = boxSize
            display.addChild(letterBox)
            
            let letter = SKLabelNode(text: "")
            if i == 0 {
                if animationIndex % 2 == 0 {
                    letter.text = "W"
                }else {
                    letter.text = "D"
                }
            }
            if i == 1 {
                if animationIndex % 2 == 0 {
                    letter.text = "O"
                }else {
                    letter.text = "I"
                }
            }
            if i == 2 {
                if animationIndex % 2 == 0 {
                    letter.text = "R"
                }else {
                    letter.text = "S"
                }
            }
            if i == 3 {
                if animationIndex % 2 == 0 {
                    letter.text = "D"
                }else {
                    letter.text = "A"
                }
            }
            if i == 4 {
                if animationIndex % 2 == 0 {
                    letter.text = "B"
                }else {
                    letter.text = "R"
                }
            }
            if i == 5 {
                if animationIndex % 2 == 0 {
                    letter.text = "O"
                }else {
                    letter.text = "M"
                }
            }
            if i == 6 {
                if animationIndex % 2 == 0 {
                    letter.text = "M"
                }else {
                    letter.text = "E"
                }
            }
            if i == 7 {
                if animationIndex % 2 == 0 {
                    letter.text = "B"
                }else {
                    letter.text = "D"
                }
            }
            letter.name = "letter"
            letter.fontColor = .redColor()
            letter.fontSize = 24.0 * scale
            letter.fontName = fontName
            letter.zPosition = 6
            letter.position = CGPoint(x: 0.0, y: 0.0 - letter.fontSize/2)
            letterBox.addChild(letter)
            
        }
    }
    
    func createButtons() {
        
        let buttonZ:CGFloat = 10.0
        let fontSize = 28.0 * scale
        let color = SKColor.redColor()
        
        settingsButton.zPosition = buttonZ
        settingsButton.fontSize = fontSize
        settingsButton.fontColor = color
        settingsButton.fontName = fontName
        settingsButton.position = CGPoint(x: ((scene?.size.width)! * 0.3), y: scene!.size.height * 0.1)
        addChild(settingsButton)
        
        playButton.zPosition = buttonZ
        playButton.fontSize = fontSize
        playButton.fontName = fontName
        playButton.fontColor = color
        playButton.position = CGPoint(x: ((scene?.size.width)! * 0.5), y: scene!.size.height * 0.1)
        addChild(playButton)
        
        helpButton.zPosition = buttonZ
        helpButton.fontSize = fontSize
        helpButton.fontName = fontName
        helpButton.fontColor = color
        helpButton.position = CGPoint(x: ((scene?.size.width)! * 0.7), y: scene!.size.height * 0.1)
        addChild(helpButton)

    }
    
    func createBackground() {
        
        let bg = SKSpriteNode(imageNamed: "bombImg.png")
        bg.position = CGPoint(x: scene!.size.width/2, y: (scene?.size.height)!/2)
        bg.zPosition = 1
        bg.size = CGSize(width: (scene?.size.width)! * 1.3, height: (scene?.size.height)! * 1.3)
        addChild(bg)
        
        
        let displayWidth = scene!.size.width * 0.7
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
        timer.fontName = fontName
        timer.fontColor = .redColor()
        timer.fontSize = 28.0 * scale
        timer.position = CGPoint(x: scene!.size.width/2, y: (scene?.size.height)! * 0.88)
        timer.zPosition = 3
        addChild(timer)
    }
    
    func moveToSettingsScene() {
        
        let settingsScene = SettingsScene()
        settingsScene.size = self.size
        settingsScene.scaleMode = self.scaleMode
        let transition = SKTransition.fadeWithDuration(1.0)
        self.scene!.view?.presentScene(settingsScene, transition: transition)
    }
    
    func moveToCategorySelectScene() {
        
        let categoryScene = CategoryScene()
        categoryScene.size = self.size
        categoryScene.scaleMode = self.scaleMode
        let transition = SKTransition.fadeWithDuration(1.0)
        self.scene!.view?.presentScene(categoryScene, transition: transition)
        
    }
    
    func moveToHelpScene() {
        
        let helpScene = HelpScene()
        helpScene.size = self.size
        helpScene.scaleMode = self.scaleMode
        let transition = SKTransition.fadeWithDuration(1.0)
        self.scene!.view?.presentScene(helpScene, transition: transition)
    }

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first as UITouch! {
            let location = touch.locationInNode(self)
            
            if settingsButton.containsPoint(location) {
                //go to settings scene
                moveToSettingsScene()
            }
            if playButton.containsPoint(location) {
                //go to category select scene
                moveToCategorySelectScene()
            }
            if helpButton.containsPoint(location) {
                //go to help scene
                moveToHelpScene()
            }
        }
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
