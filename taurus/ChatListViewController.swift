//
//  ChatListViewController.swift
//  taurus
//
//  Created by Venkatesh Muthukrishnan on 11/7/15.
//  Copyright © 2015 Srinivasan Sundaramoorthy. All rights reserved.
//

import UIKit

class ChatListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
var chatListNames = ["lets watch a movie"]
    @IBOutlet weak var chatTableView: UITableView!
    
    
    @IBOutlet weak var newPlan: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTableView.delegate = self
        chatTableView.dataSource = self
                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }
    
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chatListNames.count
    
    }
        
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("chatListCell", forIndexPath: indexPath)
            as! ChatListTableViewCell
        let row = indexPath.row
        cell.ChatName.text = chatListNames[row]
        
        
        
        return cell
    }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toSplitView" {
            if let destination = segue.destinationViewController as? CombinedViewController {
                if let chatIndex = chatTableView.indexPathForSelectedRow?.row {
                    destination.index = chatIndex
                
                }
        }
    }
    }
}