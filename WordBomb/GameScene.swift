//
//  GameScene.swift
//  WordBomb
//
//  Created by ramiro beltran on 9/3/16.
//  Copyright (c) 2016 Ramiro Beltran. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let quitButton = SKLabelNode(text: "Quit")
    let display = SKSpriteNode(imageNamed: "display.png")
    var greenLight = SKSpriteNode(imageNamed: "greenLight.png")
    var yellowLight = SKSpriteNode()
    var redLight = SKSpriteNode()
    
    var currentTime = startTime
    var animationIndex = 0
    
    override func didMoveToView(view: SKView) {
        
        createQuitButton()
        createBackground()
        updateLED(currentTime)
        createLetters()
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
        
        let timerFrame = SKSpriteNode(imageNamed: "timerFrame2.png")
        timerFrame.zPosition = 2
        timerFrame.size = CGSize(width: (scene?.size.width)! * 0.5, height: (scene?.size.height)! * 0.2)
        timerFrame.position = CGPoint(x: scene!.size.width/2, y: (scene?.size.height)! * 0.9)
        addChild(timerFrame)
        
        let time = setTimer(startTime)
        let timer = SKLabelNode(text: time)
        timer.fontName = fontName
        timer.fontColor = .redColor()
        timer.fontSize = 28.0 * scale
        timer.position = CGPoint(x: scene!.size.width/2, y: (scene?.size.height)! * 0.88)
        timer.zPosition = 3
        addChild(timer)
        
        
    }
    
    func setTimer(startTime: Int) -> String{
        
        var time = ""
        switch startTime {
        case 120:
            time = "02:00"
        case 90:
            time = "01:30"
        case 60:
            time = "01:00"
        case 30:
            time = "00:30"
        default:
            time = "01:00"
        }
        
        return time
    }
    
    func updateLED(time: Int) {
        
        let position = CGPoint(x: self.size.width * 0.22, y: self.size.height * 0.7)
        
        let base = SKSpriteNode(imageNamed: "lightBase.png")
        base.size = CGSize(width: 30.0, height: 30.0)
        base.zPosition = 4
        base.position = position
        addChild(base)
        
        greenLight.position = position
        greenLight.size = CGSize(width: 30.0, height: 30.0)
        greenLight.zPosition = 5
        greenLight.position = position
        addChild(greenLight)
        
        let fadeIn = SKAction.fadeAlphaTo(0.1, duration: 0.5)
        let fadeOut = SKAction.fadeAlphaTo(1.0, duration: 0.5)

        greenLight.runAction(SKAction.repeatActionForever(SKAction.sequence([fadeIn,fadeOut])))
//        light.runAction(SKAction.repeatActionForever(SKAction.sequence([
//            SKAction.runBlock({
//            
//                light.alpha = 2.0
//                if self.currentTime > 60 {
//                    light.lightColor = .greenColor()
//                }
//                else if self.currentTime > 30 {
//                    light.lightColor = .yellowColor()
//                }
//                else {
//                    light.lightColor = .redColor()
//                }
//            }),
//            SKAction.waitForDuration(1.0), fade
//            
//            ])))
    }

    func createQuitButton() {
        
        quitButton.fontName = fontName
        quitButton.fontSize = 18.0 * scale
        quitButton.fontColor = .redColor()
        quitButton.position = CGPoint(x: self.size.width * 0.9, y: self.size.height * 0.85)
        quitButton.zPosition = 2
        addChild(quitButton)
        
    }
    
    func exitToMainMenu() {
        
        let menu = MenuScene()
        menu.size = self.size
        menu.scaleMode = self.scaleMode
        let transition = SKTransition.fadeWithDuration(0.5)
        self.view?.presentScene(menu, transition: transition)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            if quitButton.containsPoint(location) {
                exitToMainMenu()
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
