//
//  HCEAudioPlayer.swift
//  HCExperience
//
//  Created by Alex Telek on 31/01/2016.
//
//

import UIKit
import AVFoundation

class HCEAudioPlayer: NSObject {
    
    private var audioPlayer: AVAudioPlayer!
    private var filename = ""
    
    init(filename: String) {
        self.filename = filename
    }
    
    func playAudio() {
        let soundPath = NSBundle.mainBundle().pathForResource(filename, ofType: "aif")
        let url = NSURL(fileURLWithPath: soundPath!)
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
            audioPlayer.numberOfLoops = -1
            audioPlayer.play()
        } catch {
            print("audio error")
        }
    }
    
    func stopAudio() {
        audioPlayer.stop()
    }
}