//
//  HCELevelsViewController.swift
//  HCExperience
//
//  Created by Clarence Ji on 1/31/16.
//
//

import UIKit

class HCELevelsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var viewRules: UIView!
    
    let game = HCEGame.sharedGame
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        dispatch_async(dispatch_get_main_queue(), {
            let loadedRulesView = NSBundle.mainBundle().loadNibNamed("HCETemplates", owner: self, options: nil)[0] as! UIView
            loadedRulesView.frame = CGRectMake(0, self.viewRules.frame.origin.y, UIScreen.mainScreen().bounds.width, 180)
            self.view.addSubview(loadedRulesView)
        })
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = "File \(indexPath.row + 1)"
        
        let button = cell.viewWithTag(1989) as! UIButton
        button.tag = (indexPath.row + 1)
        button.addTarget(self, action: "startLevel:", forControlEvents: .TouchUpInside)
        if (game.currentLevel - 1) < indexPath.row {
            button.setImage(UIImage(named: "padlockicon"), forState: .Normal)
            button.enabled = false
        }
        cell.contentView.bringSubviewToFront(button)

        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRowAtIndexPath(indexPath)?.selected = false
    }
    
    // MARK: - Start Level
    
    func startLevel(sender: UIButton) {
        performSegueWithIdentifier("startLevel", sender: sender)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let gameViewController = segue.destinationViewController as! HCEGameViewController
        let level = HCELevel(elements: (sender as! UIButton).tag + 1)
        gameViewController.level = level
    }
}
