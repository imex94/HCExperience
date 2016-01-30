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
    
    var range: Int
    var progressStatus: Int
    var difficulty: HCELevelDifficulty
    
    init(difficulty: HCELevelDifficulty) {
        self.range = 0
        self.progressStatus = 0
        self.difficulty = difficulty
        super.init()
    }
}
