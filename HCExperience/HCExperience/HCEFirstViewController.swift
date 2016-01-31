//
//  HCEFirstViewController.swift
//  HCExperience
//
//  Created by Clarence Ji on 1/31/16.
//
//

import UIKit

class HCEFirstViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    @IBOutlet weak var joeImageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    let myText = Array("You’re experiencing issues with the Wi-Fi. Click on \"GOOD\" icons to reduce rage, whilst \"BAD\" or \"SPAM\" icons increase rage. Try to download files without rage quitting.".characters)
    private var myCounter = 0
    private var timer: NSTimer?
    private var audioPlayer: HCEAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.sizeToFit()
        textView.layoutIfNeeded()
        textView.text = ""
        
        startButton.alpha = 0.0
        
        // Start typewriter
        fireTimer()
        
        // start animation on Joe
        let images = [UIImage(named: "joe_3")!, UIImage(named: "joe_2")!, UIImage(named: "joe_1")!]
        joeImageView.animatedImageFrom(images, withDuration: 0.2)
        
        // start music
        audioPlayer = HCEAudioPlayer(filename: "main2")
        audioPlayer.playAudio()
    }
    
    override func viewWillAppear(animated: Bool) {
        textView.sizeToFit()
        textView.layoutIfNeeded()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fireTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "typeLetter", userInfo: nil, repeats: true)
    }
    
    func typeLetter() {
        if myCounter < myText.count {
            textView.text = textView.text! + String(myText[myCounter])
            let randomInterval = Double((arc4random_uniform(8) + 1)) / 60
            timer?.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(randomInterval, target: self, selector: "typeLetter", userInfo: nil, repeats: false)
        } else {
            timer?.invalidate()
            
            animateStartButton()
        }
        myCounter++
    }
    
    func animateStartButton() {
        UIView.animateWithDuration(0.9) { () -> Void in
            self.startButton.alpha = 1.0
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
