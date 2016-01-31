//
//  HCEAudioPlayer.swift
//  HCExperience
//
//  Created by Alex Telek on 31/01/2016.
//
//

import UIKit
import AVFoundation

enum HCEAudioPlayerState {
    case Playing
    case Stopped
}

class HCEAudioPlayer: NSObject {
    private var state: HCEAudioPlayerState
    private var audioPlayer: AVAudioPlayer!
    private var filename = ""
    
    static var isPlaying = false
    
    init(filename: String) {
        self.state = .Stopped
        self.filename = filename
    }
    
    func playAudio() {
        let soundPath = NSBundle.mainBundle().pathForResource(filename, ofType: "aif")
        let url = NSURL(fileURLWithPath: soundPath!)
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
            audioPlayer.numberOfLoops = -1
            audioPlayer.play()
            state = .Playing
        } catch {
            print("audio error")
        }
    }
    
    func stopAudio() {
        audioPlayer.stop()
        state = .Stopped
    }
    
    func getState() -> HCEAudioPlayerState {
        return state
    }
    
    func setFile(filename: String) {
        self.filename = filename;
    }
}