//
//  HCEElement.swift
//  HCExperience
//
//  Created by Alex Telek on 31/01/2016.
//
//

import UIKit

enum HCEElementType {
    case Good
    case Bad
    case Spam
}

class HCEElement: UIButton {

    private let game = HCEGame.sharedGame
    
    var type: HCEElementType!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setType(index: Int) {
        switch index {
        case 0...2: type = .Good
        case 3...5: type = .Bad
        case 6...8: type = .Spam
        default: break
        }
        
        setBackgroundImage(game.icons[index], forState: .Normal)
    }
}
