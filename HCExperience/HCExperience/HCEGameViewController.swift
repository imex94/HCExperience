//
//  HCEGameViewController.swift
//  HCExperience
//
//  Created by Alex Telek on 30/01/2016.
//
//

import UIKit

class HCEGameViewController: UIViewController {

    @IBOutlet weak var wifiImageView: UIImageView!
    @IBOutlet weak var rageView: HCERageBar!
    @IBOutlet weak var downloadLabel: UILabel!
    
    private var currentRageView: HCERageBar!
    private var timer: NSTimer?
    var level = HCELevel(elements: 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTopBar()
        loadGame()
        loadBottom()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
    }
    
    func loadTopBar() {
        // Start Wifi animation
        let wifiImages = [UIImage(named: "wifi_0")!, UIImage(named: "wifi_1")!, UIImage(named: "wifi_2")!, UIImage(named: "wifi_3")!]
        wifiImageView.animatedImageFrom(wifiImages, withDuration: 2.5)
        
        let width = view.frame.width - rageView.frame.origin.x - 10
        currentRageView = HCERageBar(frame: CGRectMake(rageView.frame.origin.x, rageView.frame.origin.y, width, rageView.frame.height))
        currentRageView.fillColor = UIColor.getRageBarColor(Float(level.rage))
        currentRageView.updateProgress(CGFloat(level.rage))
        view.addSubview(currentRageView)
    }
    
    func loadGame() {
        let rects = HCEImageArranger.createRectangles(level.elements)
        
        for i in 0..<level.elements {
            
            let button = HCEElement(frame: rects[i])
            button.tag = i
            button.addTarget(self, action: "elementTapped:", forControlEvents: .TouchUpInside)
            if i == 0 {
                button.setType(Int(arc4random_uniform(3)))
            } else {
                button.setType(Int(arc4random_uniform(6) + 3))
            }
            view.addSubview(button)
        }
    }
    
    func loadBottom() {
        downloadLabel.text = "\(level.currentDownloads) / \(level.elements) downloaded"
    }
    
    func updateTimer() {
        if (level.rage >= 100) {
            timer?.invalidate()
            print("Game Over")
        } else {
            level.rage += 0.5
            currentRageView.fillColor = UIColor.getRageBarColor(Float(level.rage))
            currentRageView.updateProgress(CGFloat(level.rage))
        }
    }
    
    func elementTapped(sender: HCEElement) {
        switch sender.type! {
        case .Good: level.rage -= 10; level.currentDownloads++
        case .Bad: level.rage += 10
        case .Spam: level.rage += 5
        }
        
        downloadLabel.text = "\(level.currentDownloads) / \(level.elements) downloaded"
        
        if (level.rage <= 0) {
            level.rage = 0
        } else if (level.rage >= 100) {
            level.rage = 100
            // TODO: Game Over
            print("Game Over")
        } else if (level.currentDownloads == level.elements) {
            // TODO: Win
            print("Win")
        }
        
        currentRageView.fillColor = UIColor.getRageBarColor(Float(level.rage))
        currentRageView.updateProgress(CGFloat(level.rage))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
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
