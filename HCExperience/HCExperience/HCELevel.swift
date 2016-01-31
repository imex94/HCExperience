//
//  HCELevel.swift
//  HCExperience
//
//  Created by Alex Telek on 30/01/2016.
//
//

import UIKit

class HCELevel: NSObject {
    
    var rage: Double
    var elements: Int
    
    init(elements: Int) {
        self.rage = 0.0
        self.elements = elements
        super.init()
    }
}
