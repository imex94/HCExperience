//
//  Extensions.swift
//  HCExperience
//
//  Created by Miklos Molnar on 30/01/2016.
//
//

import Foundation
import UIKit

extension UIColor {
    class func getRageBarColor(value : Float) -> UIColor {
        var r, g : Float
        
        if (value <= 20.0) {
            r = 0.0
            g = 1.0
        } else if (value < 50.0) {
            r = (value - 20.0) / 30.0
            g = 1.0
        } else if (value == 50.0) {
            r = 1.0
            g = 1.0
        } else if (value < 80.0) {
            r = 1.0
            g = 1.0 - ((value - 50.0) / 30.0)
        } else {
            r = 1.0
            g = 0.0
        }
        
        return UIColor (red: CGFloat (r), green: CGFloat (g), blue: 0.0, alpha: 1)
    }
}