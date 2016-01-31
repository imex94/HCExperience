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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let images = [UIImage(named: "joe_3")!, UIImage(named: "joe_2")!, UIImage(named: "joe_1")!]
        joeImageView.animatedImageFrom(images, withDuration: 0.2)
        
        let wifiImages = [UIImage(named: "wifi_0")!, UIImage(named: "wifi_1")!, UIImage(named: "wifi_2")!, UIImage(named: "wifi_3")!]
        wifiImageView.animatedImageFrom(wifiImages, withDuration: 2.5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

