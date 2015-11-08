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
    var Friend_names = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsTableView.delegate = self
        friendsTableView.dataSource = self
        //getFriendsList(4, url: NSURL(string: "https://web.njit.edu/~ss2773/getfriendslist.php")!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        getFriendsList(4, url: NSURL(string: "https://web.njit.edu/~ss2773/getfriendslist.php")!)
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
 
    func getFriendsList(userid: Int, url:NSURL) {
  
        let request = NSMutableURLRequest(URL:url)
        request.HTTPMethod = "POST"
        let postString = "userid='\(userid)'"
        print(postString)
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request,completionHandler: {data,response, error ->
            Void in
            
            do{
                var i=0
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSArray
                //print(json)
                print(json!)
                for _ in json! {
                    let j = json![i]
                    self.Friend_names.append(j["userName"] as! String)
                    i++
                }
                dispatch_async(dispatch_get_main_queue(), {
                    self.friendsTableView.reloadData()
                });

            }catch _ as NSError{
                print("error")
            }
            

            
        })
        task.resume()
        
      

        
        
    }



}
