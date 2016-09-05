//
//  GameData.swift
//  WordBomb
//
//  Created by ramiro beltran on 9/3/16.
//  Copyright © 2016 Ramiro Beltran. All rights reserved.
//

import SpriteKit

let gameData = NSUserDefaults.standardUserDefaults()
var hasRun = gameData.boolForKey("hasRun")

var screenHeight:CGFloat = 0.0
var screenWidth:CGFloat = 0.0
var scale:CGFloat = 1.0

let fontName = "Bazaronite" // cool digital looking font

// start time difficulties in seconds
var tooEasy = 120
var notBad = 90
var hard = 60
var insane = 30

var startTime = notBad
var startWordLength = 8

func checkForNewInstall() {
    
    if hasRun == false {
        hasRun = true
        gameData.setBool(true, forKey: "hasRun")
    }else {
        startWordLength = gameData.integerForKey("startWordLength")
        startTime = gameData.integerForKey("startTime")
    }
}