//
//  HCEGameViewController.swift
//  HCExperience
//
//  Created by Alex Telek on 30/01/2016.
//
//

import UIKit

class HCEGameViewController: UIViewController {

    @IBOutlet var wifiImageView: UIImageView!
    @IBOutlet var rageView: HCERageBar!
    
    private var currentRageView: HCERageBar!
    var level = HCELevel(difficulty: .Easy)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Start Wifi animation
        let wifiImages = [UIImage(named: "wifi_0")!, UIImage(named: "wifi_1")!, UIImage(named: "wifi_2")!, UIImage(named: "wifi_3")!]
        wifiImageView.animatedImageFrom(wifiImages, withDuration: 2.5)
        
        level.rage = 74
        
        let width = view.frame.width - rageView.frame.origin.x - 10
        currentRageView = HCERageBar(frame: CGRectMake(rageView.frame.origin.x, rageView.frame.origin.y, width, rageView.frame.height))
        currentRageView.fillColor = UIColor.getRageBarColor(Float(level.rage))
        currentRageView.updateProgress(CGFloat(level.rage))
        view.addSubview(currentRageView)
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
