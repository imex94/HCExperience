//
//  ViewController.swift
//  HCExperience
//
//  Created by Alex Telek on 30/01/2016.
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var joeImageView: UIImageView!
    @IBOutlet weak var wifiImageView: UIImageView!
    
    @IBAction func slider(sender: UISlider) {
        colorView.backgroundColor =  UIColor.getRageBarColor(sender.value)
    }
    
    @IBOutlet weak var myTypeWriter: UILabel!
    
    let myText = Array("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.".characters)
    var myCounter = 0
    var timer:NSTimer?
    
    func fireTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "typeLetter", userInfo: nil, repeats: true)
    }
    
    func typeLetter() {
        if myCounter < myText.count {
            myTypeWriter.text = myTypeWriter.text! + String(myText[myCounter])
            let randomInterval = Double((arc4random_uniform(8) + 1)) / 50
            timer?.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(randomInterval, target: self, selector: "typeLetter", userInfo: nil, repeats: false)
        } else {
            timer?.invalidate()
        }
        myCounter++
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let images = [UIImage(named: "joe_3")!, UIImage(named: "joe_2")!, UIImage(named: "joe_1")!]
        joeImageView.animatedImageFrom(images, withDuration: 0.2)
        
        let wifiImages = [UIImage(named: "wifi_0")!, UIImage(named: "wifi_1")!, UIImage(named: "wifi_2")!, UIImage(named: "wifi_3")!]
        wifiImageView.animatedImageFrom(wifiImages, withDuration: 2.5)
        
        myTypeWriter.text = ""
        fireTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

