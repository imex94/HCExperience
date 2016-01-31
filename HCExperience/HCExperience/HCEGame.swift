//
//  HCEStatus.swift
//  HCExperience
//
//  Created by Alex Telek on 30/01/2016.
//
//

import UIKit

class HCEGame: NSObject {
    static let sharedGame = HCEGame()
    
    var currentLevel = 1
    
    let icons = [UIImage(named: "emoji_smileyface")!, UIImage(named: "emoji_tick")!, UIImage(named: "emoji_imac")!, UIImage(named: "emoji_shit")!, UIImage(named: "emoji_angryface")!, UIImage(named: "emoji_evilface")!, UIImage(named: "emoji_taytay")!, UIImage(named: "emoji_unicorn")!, UIImage(named: "emoji_upsidedown")!]
}
