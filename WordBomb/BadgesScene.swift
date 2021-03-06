//
//  HelpScene.swift
//  WordBomb
//
//  Created by ramiro beltran on 9/4/16.
//  Copyright © 2016 Ramiro Beltran. All rights reserved.
//

import SpriteKit


class BadgesScene: SKScene {
    
    let exitButton = SKLabelNode(text: "Exit")
    let goldBadge = SKSpriteNode(imageNamed: "badges.png")
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = .blackColor()
        createTitleBanner()
        createExitButton()
        createBadges()
    }
    
    func createBadges() {
        
        goldBadge.zPosition = 1
        goldBadge.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        goldBadge.size = CGSize(width: 300.0, height: 100.0)
        addChild(goldBadge)
    }
    
    func createTitleBanner() {
        
        let titleBanner = SKSpriteNode(imageNamed: "timerFrame.png")
        titleBanner.size = CGSize(width: (scene?.size.width)! * 0.5, height: (scene?.size.height)! * 0.2)
        titleBanner.zPosition = 1
        titleBanner.position = CGPoint(x: self.size.width/2, y: self.size.height * 0.9)
        addChild(titleBanner)
        
        let titleText = SKLabelNode(text: "Badges")
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
            
            if exitButton.containsPoint(location) {
                
                moveToMenuScene()
            }
        }
    }
    
}