//
//  CategoryScene.swift
//  WordBomb
//
//  Created by ramiro beltran on 9/3/16.
//  Copyright © 2016 Ramiro Beltran. All rights reserved.
//

import SpriteKit


class CategoryScene: SKScene {
    
    let exitButton = SKLabelNode(text: "Exit")
    let unlockButton = SKSpriteNode(imageNamed: "unlockButton.png")
    let selectAll = SKSpriteNode(imageNamed: "selectAll.png")
    var allSelected = false
    let playButton = SKSpriteNode(imageNamed: "play.png")
    
    //category icons
    var animals = SKSpriteNode()
    var cooking = SKSpriteNode()
    var geography = SKSpriteNode()
    var heroes = SKSpriteNode()
    var medical = SKSpriteNode()
    var music = SKSpriteNode()
    var olympics = SKSpriteNode()
    var technology = SKSpriteNode()
    var sports = SKSpriteNode()
    var space = SKSpriteNode()
    var catIconArray:[SKSpriteNode] = []
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = .blackColor()
        createTitleBanner()
        createExitButton()
        createBottomButtons()
        createIcons()
        setLocks()
    }
    
    func createIcons() {
        
        let fontSize = 16.0 * scale
        
        //animals icon and title
        animals = Category.newIcon("animals.png")
        let yOffset = animals.size.height/2 + fontSize
        animals.position = CGPoint(x: self.size.width * 0.1, y: self.size.height * 0.7)
        addChild(animals)
        _ = Category.newLabel("Animals", parent: self, point: CGPoint(x: animals.position.x, y: animals.position.y - (animals.size.height/2 + fontSize)))
        
        //cooking icon and title
        cooking = Category.newIcon("cooking.png")
        cooking.position = CGPoint(x: self.size.width * 0.3, y: self.size.height * 0.7)
        addChild(cooking)
        _ = Category.newLabel("Cooking", parent: self, point: CGPoint(x: cooking.position.x, y: cooking.position.y - (cooking.size.height/2 + fontSize)))
        
        //sports icon and title
        sports = Category.newIcon("sports.png")
        sports.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.7)
        addChild(sports)
        _ = Category.newLabel("Sports", parent: self, point: CGPoint(x: sports.position.x, y: sports.position.y - (sports.size.height/2 + fontSize)))

        //heros icon and title
        heroes = Category.newIcon("heros.png")
        heroes.position = CGPoint(x: self.size.width * 0.7, y: self.size.height * 0.7)
        addChild(heroes)
        _ = Category.newLabel("Heroes", parent: self, point: CGPoint(x: heroes.position.x, y: heroes.position.y - (heroes.size.height/2 + fontSize)))
        
        //medical icon and title
        medical = Category.newIcon("medical.png")
        medical.position = CGPoint(x: self.size.width * 0.9, y: self.size.height * 0.7)
        addChild(medical)
        _ = Category.newLabel("Medical", parent: self, point: CGPoint(x: medical.position.x, y: medical.position.y - (medical.size.height/2 + fontSize)))
        
        //olympics icon and title
        olympics = Category.newIcon("olympics.png")
        olympics.position = CGPoint(x: self.size.width * 0.1, y: self.size.height * 0.4)
        addChild(olympics)
        _ = Category.newLabel("Olympics", parent: self, point: CGPoint(x: olympics.position.x, y: olympics.position.y - yOffset))
        
        //music icon and title
        music = Category.newIcon("music.png")
        music.position = CGPoint(x: self.size.width * 0.3, y: self.size.height * 0.4)
        addChild(music)
        _ = Category.newLabel("Music", parent: self, point: CGPoint(x: music.position.x, y: music.position.y - yOffset))
        
        //space icon and title
        space = Category.newIcon("space.png")
        space.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.4)
        addChild(space)
        _ = Category.newLabel("Space", parent: self, point: CGPoint(x: space.position.x, y: space.position.y - yOffset))
        
        //technology icon and title
        technology = Category.newIcon("technology.png")
        technology.position = CGPoint(x: self.size.width * 0.7, y: self.size.height * 0.4)
        addChild(technology)
        _ = Category.newLabel("Technology", parent: self, point: CGPoint(x: technology.position.x, y: technology.position.y - yOffset))
        
        //geography icon and title
        geography = Category.newIcon("geography.png")
        geography.position = CGPoint(x: self.size.width * 0.9,y: self.size.height * 0.4)
        addChild(geography)
        _ = Category.newLabel("Geography", parent: self, point: CGPoint(x: geography.position.x, y: geography.position.y - yOffset))
        
         catIconArray = [animals, cooking, heroes, geography, medical, music, olympics, space, sports, technology]
    }
    
    func createTitleBanner() {
        
        let titleBanner = SKSpriteNode(imageNamed: "timerFrame.png")
        titleBanner.size = CGSize(width: (scene?.size.width)! * 0.6, height: (scene?.size.height)! * 0.2)
        titleBanner.zPosition = 1
        titleBanner.position = CGPoint(x: self.size.width/2, y: self.size.height * 0.9)
        addChild(titleBanner)
        
        let titleText = SKLabelNode(text: "Select Categories")
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
    
    func setLocks() {
        //full game has not been purchase
        if fullGame == false {
            
            lockedCategories.append(.heroes)
            lockedCategories.append(.geography)
            lockedCategories.append(.music)
            lockedCategories.append(.medical)
            lockedCategories.append(.olympics)
            lockedCategories.append(.space)
            lockedCategories.append(.technology)
            
            
            lockedIcons.append(heroes)
            lockedIcons.append(geography)
            lockedIcons.append(music)
            lockedIcons.append(medical)
            lockedIcons.append(olympics)
            lockedIcons.append(technology)
            lockedIcons.append(space)
            
            for cat in lockedIcons {
                let lock = SKSpriteNode(imageNamed: "lock.png")
                lock.position = cat.position
                lock.zPosition = cat.zPosition + 1
                lock.size = cat.size
                lock.name = "lock"
                addChild(lock)
            }
            
        }
        // if full game has been purchased
        else {
            lockedCategories = []
            lockedIcons = []
            self.enumerateChildNodesWithName("lock", usingBlock: { (node, stop) -> Void in
                if node.name == "lock" {
                    node.removeFromParent()
                }
            })
        }
    }
    
    func selectSingleCategory(cat: SKSpriteNode, type: Categories) {
        
        //if category is already selected
        if chosenIcons.contains(cat){
            
            cat.removeAllChildren()
            
            var index = 0
            print(index)
            for cat in chosenCategories {
                if cat.hashValue == type.hashValue {
                    break
                }
                else {
                    index += 1
                }
            }
            chosenIcons.removeAtIndex(index)
            chosenCategories.removeAtIndex(index)
            
        }
        else {
            
            chosenIcons.append(cat)
            chosenCategories.append(type)
            let check = SKSpriteNode(imageNamed: "check.png")
            check.zPosition = cat.zPosition + 1
            //check.position = cat.position
            check.size = cat.size
            check.name = "check"
            cat.addChild(check)
        }

        print("chosen categories are: \(chosenCategories)")
        if chosenCategories.count < 1 {
            playButton.alpha = 0.5
        }else {
            playButton.alpha = 1.0
        }
    }
    
    func selectAllCategories() {
        
        if allSelected == false {
            
            if fullGame { //all categories are available
                
                for cat in Categories.allValues {
                    chosenCategories.append(cat)
                }
                for cat in catIconArray {
                    chosenIcons.append(cat)
                    let check = SKSpriteNode(imageNamed: "check.png")
                    check.zPosition = cat.zPosition + 1
                    //check.position = cat.position
                    check.size = cat.size
                    check.name = "check"
                    cat.addChild(check)
                }
                
                
            }else if fullGame == false {
                chosenCategories.append(.animals)
                chosenCategories.append(.cooking)
                chosenCategories.append(.sports)
                chosenIcons.append(animals)
                chosenIcons.append(cooking)
                chosenIcons.append(sports)
                
                for cat in chosenIcons {
                    let check = SKSpriteNode(imageNamed: "check.png")
                    check.zPosition = cat.zPosition + 1
                    //check.position = cat.position
                    check.size = cat.size
                    check.name = "check"
                    cat.addChild(check)
                }
                
            }
            allSelected = true
            

        }
        //if all unlocked categories are currently selected
        else {
            
            chosenCategories = []
            for cat in chosenIcons {
            
                cat.removeAllChildren()
            }
            chosenIcons = []
            allSelected = false
        }
        
        print("chosen categories: \(chosenCategories)")
        if chosenCategories.count < 1 {
            playButton.alpha = 0.5
        }else {
            playButton.alpha = 1.0
        }
    }
    
    func createBottomButtons() {
        
        let buttonWidth:CGFloat = 130.0 * scale
        let buttonHeight:CGFloat = 40.0 * scale
        let size = CGSize(width: buttonWidth, height: buttonHeight)
        
        if fullGame == false {
            unlockButton.zPosition = 3
            unlockButton.size = size
            unlockButton.position = CGPoint(x: self.size.width * 0.25, y: (self.size.height * 0.01) + unlockButton.size.height/2)
            addChild(unlockButton)
        }
        
        selectAll.zPosition = 3
        selectAll.size = size
        selectAll.position = CGPoint(x: self.size.width * 0.5, y: (self.size.height * 0.01) + selectAll.size.height/2)
        addChild(selectAll)
        
        playButton.zPosition = 3
        playButton.size = size
        playButton.position = CGPoint(x: self.size.width * 0.75, y: (self.size.height * 0.01) + playButton.size.height/2)
        addChild(playButton)
        if chosenCategories.count < 1 {
            playButton.alpha = 0.5
        }
        
    }
    
    func moveToGameScene() {
        
        let gameScene = GameScene()
        gameScene.size = self.size
        gameScene.scaleMode = self.scaleMode
        let transition = SKTransition.fadeWithDuration(0.5)
        self.scene!.view?.presentScene(gameScene, transition: transition)
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
            
            if animals.containsPoint(location) {
                selectSingleCategory(animals, type: .animals)
            }
            if cooking.containsPoint(location) {
                selectSingleCategory(cooking, type: .cooking)
            }
            if heroes.containsPoint(location) && fullGame{
                selectSingleCategory(heroes, type: .heroes)
            }
            if geography.containsPoint(location) && fullGame{
                selectSingleCategory(geography, type: .geography)
            }
            if medical.containsPoint(location) && fullGame{
                selectSingleCategory(medical, type: .medical)
            }
            if music.containsPoint(location) && fullGame{
                selectSingleCategory(music, type: .music)
            }
            if olympics.containsPoint(location) && fullGame{
                selectSingleCategory(olympics, type: .olympics)
            }
            if technology.containsPoint(location) && fullGame{
                selectSingleCategory(technology, type: .technology)
            }
            if space.containsPoint(location) && fullGame{
                selectSingleCategory(space, type: .space)
            }
            if sports.containsPoint(location) {
                selectSingleCategory(sports, type: .sports)
            }
            
            if selectAll.containsPoint(location) {
                //will select or deselect all available categories
                selectAllCategories()
            }
            if playButton.containsPoint(location) {
                if chosenCategories.count > 0 {
                    moveToGameScene()
                }
            }
            
            if unlockButton.containsPoint(location) {
                //TODO: Add Unlock capability in itunes
                //Temporary test
                fullGame = true
                setLocks()
            }
            
            if exitButton.containsPoint(location) {
                
                moveToMenuScene()
            }
        }
    }
    
}