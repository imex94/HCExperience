//
//  HCELevel.swift
//  HCExperience
//
//  Created by Alex Telek on 30/01/2016.
//
//

import UIKit

class HCELevel: NSObject {
    
    var levelNumber: Int
    var rage: Double
    var elements: Int
    var currentDownloads: Int
    
    init(elements: Int) {
        self.rage = 0.0
        self.currentDownloads = 0
        self.levelNumber = 1
        self.elements = elements
        super.init()
    }
}
