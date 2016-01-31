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
    private var imageArranger: HCEImageArranger!
    var level = HCELevel(difficulty: .Easy)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        level.elements = 3
        level.rage = 5
        
        loadTopBar()
        loadGame()
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
        imageArranger = HCEImageArranger(count: level.elements)
        let rects = imageArranger.createRectangles()
        
        for i in 0..<level.elements {
            
            let button = UIButton(frame: rects[i])
            button.tag = i
            button.backgroundColor = UIColor.getRageBarColor(Float((i * 20) + 1))
            view.addSubview(button)
        }
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
