//
//  HCELoadingView.swift
//  HCExperience
//
//  Created by Alex Telek on 31/01/2016.
//
//

import UIKit

class HCELoadingView: UIView {

    private var images = [UIImage]()
    private var loadImageView: UIImageView
    private var isAnimate = false
    
    override init(frame: CGRect) {
        loadImageView = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        super.init(frame: frame)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        loadImageView = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure() {
        backgroundColor = UIColor.whiteColor()
        loadImageView.center = CGPointMake((bounds.width / 2), (bounds.height / 2) - 50)
        addSubview(loadImageView)
        for i in 0..<7 {
            images.append(UIImage(named: "pizza_\(i)")!)
        }
     }
    
    func startLoading() {
        loadImageView.animatedImageFrom(images, withDuration: 0.8)
        //loadImageView.animatedImageFrom(images.reverse(), withDuration: 0.1, repeatition: 1)
    }
    
    func stopLoading() {
        loadImageView.stopAnimating()
    }
}
