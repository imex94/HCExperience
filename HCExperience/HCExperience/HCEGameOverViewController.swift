//
//  HCEGameOverViewController.swift
//  HCExperience
//
//  Created by Alex Telek on 31/01/2016.
//
//

import UIKit

class HCEGameOverViewController: UIViewController {

    var level = HCELevel(elements: 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "again" {
            let gameViewController = segue.destinationViewController as! HCEGameViewController
            let newLevel = HCELevel(elements: level.elements)
            newLevel.levelNumber = level.levelNumber
            gameViewController.level = newLevel
        }
    }
}
