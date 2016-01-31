//
//  HCELoadingView.swift
//  HCExperience
//
//  Created by Alex Telek on 31/01/2016.
//
//

import UIKit

class HCELoadingView: UIView {

    private var loadImageView: UIImageView
    private var isAnimate = false
    
    override init(frame: CGRect) {
        loadImageView = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        super.init(frame: frame)
        loadImageView.center = center
    }

    required init?(coder aDecoder: NSCoder) {
        loadImageView = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        super.init(coder: aDecoder)
        loadImageView.center = center
    }
    
    func startLoading() {
        isAnimate = true
        while (isAnimate) {
            let images = [UIImage(named: "joe_3")!, UIImage(named: "joe_2")!, UIImage(named: "joe_1")!]
            loadImageView.animatedImageFrom(images, withDuration: 0.8, repeatition: 1)
            loadImageView.animatedImageFrom(images.reverse(), withDuration: 0.4, repeatition: 1)
        }
    }
    
    func stopLoading() {
        isAnimate = false
        loadImageView.stopAnimating()
    }
}
