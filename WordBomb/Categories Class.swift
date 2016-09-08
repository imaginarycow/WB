//
//  Categories Class.swift
//  WordBomb
//
//  Created by ramiro beltran on 9/6/16.
//  Copyright © 2016 Ramiro Beltran. All rights reserved.
//

import SpriteKit

enum Categories : Int {
    case animals = 0, cooking = 1, heroes = 2, geography = 3, medical = 4, music = 5, olympics = 6, space = 7, sports = 8, technology = 9
    
    static let allValues = [animals,cooking,heroes,geography,medical,music,olympics,space,sports,technology]
}

var lockedIcons:[SKSpriteNode] = []
var lockedCategories:[Categories] = []
var chosenCategories:[Categories] = []
var chosenIcons:[SKSpriteNode] = []

class Category {
    
    
    class func newIcon(name: String) ->SKSpriteNode{
        
        let size = CGSize(width: 50.0 * scale, height: 50.0 * scale)
        
        
        let icon = SKSpriteNode(imageNamed: name)
        icon.size = size
        icon.zPosition = 2
        
        return icon
    }
    
    class func newLabel(title: String, parent: SKScene, point: CGPoint){
        
        let fontSize = 16.0 * scale
        
        let title = SKLabelNode(text: title)
        title.fontSize = fontSize
        title.fontColor = .redColor()
        title.fontName = fontName
        title.zPosition = 2
        title.position = point
        
        parent.addChild(title)
    }
}
