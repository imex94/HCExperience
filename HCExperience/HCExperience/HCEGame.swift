//
//  HCEStatus.swift
//  HCExperience
//
//  Created by Alex Telek on 30/01/2016.
//
//

import UIKit

enum HCEState {
    case Init
    case LevelSelection
    case Game
}

class HCEGame: NSObject {
    static let sharedGame = HCEGame()
    
    var currentState = HCEState.Init
    var currentLevel = 1
}
