//
//  ChatListViewController.swift
//  taurus
//
//  Created by Venkatesh Muthukrishnan on 11/7/15.
//  Copyright © 2015 Srinivasan Sundaramoorthy. All rights reserved.
//

import UIKit

class ChatListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
var chatListNames = ["movie","series"]
    @IBOutlet weak var chatTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTableView.delegate = self
        chatTableView.dataSource = self
        let newPlanButton: UIBarButtonItem = UIBarButtonItem(title: "New Plan", style: UIBarButtonItemStyle.Plain, target: self, action: "addNewPlan")
        self.navigationItem.rightBarButtonItem = newPlanButton
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

    func addNewPlan() {
        
    }
}
