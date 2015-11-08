//
//  FriendsListViewController.swift
//  taurus
//
//  Created by Venkatesh Muthukrishnan on 11/7/15.
//  Copyright © 2015 Srinivasan Sundaramoorthy. All rights reserved.
//

import UIKit

class FriendsListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var friendsTableView: UITableView!
    var Friend_names = ["arif","tushar","ravi"]
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsTableView.delegate = self
        friendsTableView.dataSource = self
        

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
        
        return Friend_names.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("friendsListCell", forIndexPath: indexPath)
            as! FriendsListTableViewCell
        let row = indexPath.row
        cell.friendName.text = Friend_names[row]
        
        
        
        return cell
}    




}
