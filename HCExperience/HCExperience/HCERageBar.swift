//
//  HCERageBar.swift
//  HCExperience
//
//  Created by Alex Telek on 30/01/2016.
//
//

import UIKit
import QuartzCore

class HCERageBar: UIView {

    /** Fill color of the circle, default is the theme color based on the index. Default is red color. (Required) */
    var fillColor = UIColor.greenColor() {
        didSet {
            overShape.backgroundColor = fillColor.CGColor
        }
    }
    
    /** The progress of the bar between 0 and 100. Default is 0. (Required) */
    var progress: CGFloat = 0.0
    
    /** The corner radius of the progress bar. Default is 12. */
    var cornerRadius: CGFloat = 2
    
    private var overShape: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clearColor()
        
        let backgroundShape = CAShapeLayer()
        backgroundShape.frame = CGRectMake(0, 0, frame.width, frame.height)
        backgroundShape.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).CGPath
        backgroundShape.fillColor = UIColor.clearColor().CGColor
        backgroundShape.strokeColor = UIColor.colorWithRGB(155, g: 155, b: 155).CGColor
        backgroundShape.lineWidth = 2
        layer.addSublayer(backgroundShape)
        
        overShape = CAShapeLayer()
        overShape.frame = CGRectMake(0, 0, frame.width * progress, frame.height)
        overShape.backgroundColor = fillColor.CGColor
        overShape.cornerRadius = cornerRadius
        layer.addSublayer(overShape)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    /** Update progress of the bar, withput delay. */
    func updateProgress(progress: CGFloat) {
        updateProgressUsingDelay(progress, delay: 0)
    }
    
    /** Update progress of the bar based on delay. */
    func updateProgressUsingDelay(progress: CGFloat, delay: NSTimeInterval) {
        self.progress = progress
        overShape.frame = CGRectMake(0, 0, frame.width * (progress / 100.0), frame.height)
    }

}