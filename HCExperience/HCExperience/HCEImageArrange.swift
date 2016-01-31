//
//  HCEImageArrange.swift
//  HCExperience
//
//  Created by Miklos Molnar on 30/01/2016.
//
//

import Foundation
import UIKit

class HCEImageArranger {
    var count : Int;
    var rectangles = [CGRect]()
    
    init(count: Int) {
        self.count = count;
    }
    
    func createRectangles() -> [CGRect] {
        var randomX : CGFloat
        var randomY : CGFloat
        var newRectangle : CGRect
            
        while (rectangles.count != count) {
            randomX = CGFloat(arc4random_uniform(UInt32(UIScreen.mainScreen().bounds.width - 150)))
            randomY = CGFloat(arc4random_uniform(UInt32(UIScreen.mainScreen().bounds.height - 150)))
            newRectangle = CGRect(x: randomX, y: randomY, width: 100, height: 100)
            
            if (rectangles.count == 0) {
                // First rectangle, no need for collision check
                rectangles.append(newRectangle)
            } else {
                var collision = false
                
                for r in rectangles {
                    if (CGRectIntersectsRect(r, newRectangle)) {
                        collision = true
                        break
                    }
                }
                
                if (!collision) {
                    rectangles.append(newRectangle)
                }
            }
        }
        
        return rectangles;
    }
    
    func getCount() -> Int {
        return count
    }
}