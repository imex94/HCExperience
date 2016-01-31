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
    private var loadingView: HCELoadingView!
    private var rageTimer: NSTimer?
    private var loadingTimer: NSTimer?
    private var gameTimer: NSTimer?
    private var isGameRunning = true
    
    var level = HCELevel(elements: 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTopBar()
        loadGame()
        loadBottom()
        
        rageTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateRage", userInfo: nil, repeats: true)
    }
    
    func loadTopBar() {
        
        let width = view.frame.width - rageView.frame.origin.x - 10
        currentRageView = HCERageBar(frame: CGRectMake(rageView.frame.origin.x, rageView.frame.origin.y, width, rageView.frame.height))
        currentRageView.fillColor = UIColor.getRageBarColor(Float(level.rage))
        currentRageView.updateProgress(CGFloat(level.rage))
        view.addSubview(currentRageView)
    }
    
    func loadGame() {
        wifiImageView.stopAnimating()
        wifiImageView.image = UIImage(named: "wifi_3")
        
        let rects = HCEImageArranger.createRectangles(level.elements)
        
        for i in 0..<level.elements {
            
            let button = HCEElement(frame: rects[i])
            button.tag = (i + 10)
            button.addTarget(self, action: "elementTapped:", forControlEvents: .TouchUpInside)
            if i <= 0 {
                button.setType(Int(arc4random_uniform(2)))
            } else {
                button.setType(Int(arc4random_uniform(5) + 3))
            }
            view.addSubview(button)
        }
        
        gameTimer = NSTimer.scheduledTimerWithTimeInterval(1.5 - (Double(level.levelNumber - 1) * 0.132), target: self, selector: "gameScreenTimerUpdate", userInfo: nil, repeats: false)
    }
    
    func loadBottom() {
        downloadLabel.text = "\(level.currentDownloads) / \(level.elements) downloaded"
    }
    
    // Timer
    
    func updateRage() {
        if (level.rage >= 100) {
            rageTimer?.invalidate()
            gameTimer?.invalidate()
            loadingTimer?.invalidate()
            level.rage = 100
            performSegueWithIdentifier("gameOver", sender: self)
        } else {
            level.rage += 0.5
            currentRageView.fillColor = UIColor.getRageBarColor(Float(level.rage))
            currentRageView.updateProgress(CGFloat(level.rage))
        }
    }
    
    func loadingScreenTimerUpdate() {
        isGameRunning = true
        
        loadingTimer?.invalidate()
        loadingView.stopLoading()
        loadingView.removeFromSuperview()
        
        loadGame()
    }
    
    func gameScreenTimerUpdate() {
        
        isGameRunning = false
        
        for i in 0..<level.elements {
            view.viewWithTag(i + 10)?.removeFromSuperview()
        }
        
        loadingView = HCELoadingView(frame: CGRectMake(0, 50, view.frame.width, view.frame.height - 100))
        view.addSubview(loadingView)
        loadingView.startLoading()
        
        // Start Wifi animation
        let wifiImages = [UIImage(named: "wifi_0")!, UIImage(named: "wifi_1")!, UIImage(named: "wifi_2")!, UIImage(named: "wifi_3")!]
        wifiImageView.animatedImageFrom(wifiImages, withDuration: 2.5)
        
        gameTimer?.invalidate()
        loadingTimer = NSTimer.scheduledTimerWithTimeInterval(1.3 + (Double(level.levelNumber - 1) * 0.132), target: self, selector: "loadingScreenTimerUpdate", userInfo: nil, repeats: false)
    }
    
    func elementTapped(sender: HCEElement) {
        switch sender.type! {
        case .Good: level.rage -= 10; level.currentDownloads++
        case .Bad: level.rage += 10
        case .Spam: level.rage += 5
        }
        
        if isGameRunning {
            gameTimer?.invalidate()
            gameScreenTimerUpdate()
        }
        
        downloadLabel.text = "\(level.currentDownloads) / \(level.elements) downloaded"
        
        if (level.rage <= 0) {
            level.rage = 0
        } else if (level.rage >= 100) {
            level.rage = 100
            rageTimer?.invalidate()
            gameTimer?.invalidate()
            loadingTimer?.invalidate()
            performSegueWithIdentifier("gameOver", sender: self)
        } else if (level.currentDownloads == level.elements) {
            rageTimer?.invalidate()
            gameTimer?.invalidate()
            loadingTimer?.invalidate()
            performSegueWithIdentifier("win", sender: self)
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
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        switch segue.identifier! {
            case "gameOver":
                let gameOverView = segue.destinationViewController as! HCEGameOverViewController
                let newLevel = HCELevel(elements: level.elements)
                newLevel.levelNumber = level.levelNumber
                gameOverView.level = newLevel
            case "win":
                HCEGame.sharedGame.currentLevel++
                HCEGame.sharedGame.currentLevel.saveWithKey("currentLevel")
        default: break
        }
    }

}
