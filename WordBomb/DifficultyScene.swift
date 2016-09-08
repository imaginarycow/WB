//
//  SettingsScene.swift
//  WordBomb
//
//  Created by ramiro beltran on 9/3/16.
//  Copyright © 2016 Ramiro Beltran. All rights reserved.
//

import SpriteKit

class DifficultyScene: SKScene {
    
    let exitButton = SKLabelNode(text: "Done")
    let tooEasy = SKLabelNode(text: "2:00 - too easy")
    let notBad = SKLabelNode(text: "1:30 - not bad")
    let hard = SKLabelNode(text: "1:00 - hard")
    let insane = SKLabelNode(text: "0:30 - insane")
    
    let three = SKLabelNode(text: "3")
    let four = SKLabelNode(text: "4")
    let five = SKLabelNode(text: "5")
    let six = SKLabelNode(text: "6")
    let seven = SKLabelNode(text: "7")
    let eight = SKLabelNode(text: "8")

    let timeArrow = SKSpriteNode(imageNamed: "arrows.png")
    let lettArrow = SKSpriteNode(imageNamed: "arrows.png")
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = .blackColor()
        createTitleBanner()
        createExitButton()
        createTimeOptions()
        createLetterOptions()
        setLetterArrow(startWordLength)
        setTimerArrow(startTime)
    }
    
    func setLetterArrow(len: Int) {
        lettArrow.removeFromParent()
        let size = CGSize(width: 20.0 * scale, height: 20.0 * scale)
        let yOffset = size.height/4
        lettArrow.zPosition = 1
        lettArrow.size = size
        
        switch len {
        case 3:
            lettArrow.position = CGPoint(x: self.size.width * 0.6, y: self.size.height * 0.6 + yOffset)
        case 4:
            lettArrow.position = CGPoint(x: self.size.width * 0.6, y: self.size.height * 0.45 + yOffset)
        case 5:
            lettArrow.position = CGPoint(x: self.size.width * 0.6, y: self.size.height * 0.3 + yOffset)
        case 6:
            lettArrow.position = CGPoint(x: self.size.width * 0.8, y: self.size.height * 0.6 + yOffset)
        case 7:
            lettArrow.position = CGPoint(x: self.size.width * 0.8, y: self.size.height * 0.45 + yOffset)
        case 8:
            lettArrow.position = CGPoint(x: self.size.width * 0.8, y: self.size.height * 0.3 + yOffset)
        default:
            lettArrow.position = CGPoint(x: self.size.width * 0.8, y: self.size.height * 0.6 + yOffset)
        }
        gameData.setInteger(len, forKey: "startWordLength")
        gameData.synchronize()
        addChild(lettArrow)
        
    }
    
    func createLetterOptions() {
        
        let fSize = 20.0 * scale
        
        let numbLetters = SKLabelNode(text: "Max # of Letters")
        numbLetters.fontName = fontName
        numbLetters.fontColor = .redColor()
        numbLetters.fontSize = fSize
        numbLetters.zPosition = 1
        numbLetters.position = CGPoint(x: self.size.width * 0.8, y: self.size.height * 0.7)
        addChild(numbLetters)
        
        three.fontName = fontName
        three.fontSize = fSize
        three.fontColor = .redColor()
        three.zPosition = 1
        three.position = CGPoint(x: self.size.width * 0.65, y: self.size.height * 0.6)
        addChild(three)
        
        four.fontName = fontName
        four.fontSize = fSize
        four.fontColor = .redColor()
        four.zPosition = 1
        four.position = CGPoint(x: self.size.width * 0.65, y: self.size.height * 0.45)
        addChild(four)
        
        five.fontName = fontName
        five.fontSize = fSize
        five.fontColor = .redColor()
        five.zPosition = 1
        five.position = CGPoint(x: self.size.width * 0.65, y: self.size.height * 0.3)
        addChild(five)
        
        six.fontName = fontName
        six.fontSize = fSize
        six.fontColor = .redColor()
        six.zPosition = 1
        six.position = CGPoint(x: self.size.width * 0.85, y: self.size.height * 0.6)
        addChild(six)
        
        seven.fontName = fontName
        seven.fontSize = fSize
        seven.fontColor = .redColor()
        seven.zPosition = 1
        seven.position = CGPoint(x: self.size.width * 0.85, y: self.size.height * 0.45)
        addChild(seven)
        
        eight.fontName = fontName
        eight.fontSize = fSize
        eight.fontColor = .redColor()
        eight.zPosition = 1
        eight.position = CGPoint(x: self.size.width * 0.85, y: self.size.height * 0.3)
        addChild(eight)

    }
    
    func setTimerArrow(time: Int) {
        timeArrow.removeFromParent()
        let size = CGSize(width: 20.0 * scale, height: 20.0 * scale)
        timeArrow.zPosition = 1
        timeArrow.zRotation = DegToRad(180.0)
        timeArrow.size = size
        let yOffset = timeArrow.size.height/4
        
        switch time {
        case 120:
            timeArrow.position = CGPoint(x: self.size.width * 0.4, y: self.size.height * 0.6 + yOffset)
        case 90:
            timeArrow.position = CGPoint(x: self.size.width * 0.4, y: self.size.height * 0.5 + yOffset)
        case 60:
            timeArrow.position = CGPoint(x: self.size.width * 0.4, y: self.size.height * 0.4 + yOffset)
        case 30:
            timeArrow.position = CGPoint(x: self.size.width * 0.4, y: self.size.height * 0.3 + yOffset)
        default:
            timeArrow.position = CGPoint(x: self.size.width * 0.4, y: self.size.height * 0.2 + yOffset)
            
        }
        gameData.setInteger(time, forKey: "startTime")
        gameData.synchronize()
        addChild(timeArrow)
    }

    
    func createTimeOptions() {
        
        let fSize = 20.0 * scale
        
        let timerLabel = SKLabelNode(text: "Start Time")
        timerLabel.fontSize = fSize
        timerLabel.zPosition = 1
        timerLabel.position = CGPoint(x: self.size.width * 0.2, y: self.size.height * 0.7)
        timerLabel.fontColor = .redColor()
        timerLabel.fontName = fontName
        addChild(timerLabel)
        
        tooEasy.zPosition = 1
        tooEasy.position = CGPoint(x: self.size.width * 0.2, y: self.size.height * 0.6)
        tooEasy.fontSize = fSize
        tooEasy.fontColor = .redColor()
        tooEasy.fontName = fontName
        addChild(tooEasy)
        
        notBad.zPosition = 1
        notBad.position = CGPoint(x: self.size.width * 0.2, y: self.size.height * 0.5)
        notBad.fontSize = fSize
        notBad.fontColor = .redColor()
        notBad.fontName = fontName
        addChild(notBad)
        
        hard.zPosition = 1
        hard.position = CGPoint(x: self.size.width * 0.2, y: self.size.height * 0.4)
        hard.fontSize = fSize
        hard.fontColor = .redColor()
        hard.fontName = fontName
        addChild(hard)

        insane.zPosition = 1
        insane.position = CGPoint(x: self.size.width * 0.2, y: self.size.height * 0.3)
        insane.fontSize = fSize
        insane.fontColor = .redColor()
        insane.fontName = fontName
        addChild(insane)

    }
    
    func createTitleBanner() {
        
        let titleBanner = SKSpriteNode(imageNamed: "timerFrame.png")
        titleBanner.size = CGSize(width: (scene?.size.width)! * 0.5, height: (scene?.size.height)! * 0.2)
        titleBanner.zPosition = 1
        titleBanner.position = CGPoint(x: self.size.width/2, y: self.size.height * 0.9)
        addChild(titleBanner)
        
        let titleText = SKLabelNode(text: "Difficulty")
        titleText.fontColor = .redColor()
        titleText.fontSize = 30.0 * scale
        titleText.fontName = fontName
        titleText.zPosition = 2
        titleText.position = CGPoint(x: 0.0, y: 0.0 - (titleText.fontSize/2))
        titleBanner.addChild(titleText)
    }
    
    func createExitButton() {
        
        exitButton.zPosition = 1
        exitButton.position = CGPoint(x: self.size.width * 0.9, y: self.size.height * 0.85)
        exitButton.fontSize = 18.0 * scale
        exitButton.fontName = fontName
        exitButton.fontColor = .redColor()
        addChild(exitButton)
    }
    
    func moveToMenuScene() {
        
        let menuScene = MenuScene()
        menuScene.size = self.size
        menuScene.scaleMode = self.scaleMode
        let transition = SKTransition.fadeWithDuration(1.0)
        self.scene!.view?.presentScene(menuScene, transition: transition)
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first as UITouch! {
            let location = touch.locationInNode(self)
            
            if tooEasy.containsPoint(location) {
                setTimerArrow(120)
            }
            if notBad.containsPoint(location) {
                setTimerArrow(90)
            }
            if hard.containsPoint(location) {
                setTimerArrow(60)
            }
            if insane.containsPoint(location) {
                setTimerArrow(30)
            }
            
            if three.containsPoint(location) {
                setLetterArrow(3)
            }
            if four.containsPoint(location) {
                setLetterArrow(4)
            }
            if five.containsPoint(location) {
                setLetterArrow(5)
            }
            if six.containsPoint(location) {
                setLetterArrow(6)
            }
            if seven.containsPoint(location) {
                setLetterArrow(7)
            }
            if eight.containsPoint(location) {
                setLetterArrow(8)
            }
            
            if exitButton.containsPoint(location) {
                
                moveToMenuScene()
            }
        }
    }
    
}