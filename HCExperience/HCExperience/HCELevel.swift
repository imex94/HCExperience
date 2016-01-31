//
//  HCELevel.swift
//  HCExperience
//
//  Created by Alex Telek on 30/01/2016.
//
//

import UIKit

enum HCELevelDifficulty {
    case Easy
    case Medium
    case Hard
}

class HCELevel: NSObject {
    
    var rage: Int
    var progressStatus: Int
    var difficulty: HCELevelDifficulty
    
    init(difficulty: HCELevelDifficulty) {
        self.rage = 0
        self.progressStatus = 0
        self.difficulty = difficulty
        super.init()
    }
}
