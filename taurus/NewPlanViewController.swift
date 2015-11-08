//
//  NewPlanViewController.swift
//  taurus
//
//  Created by Venkatesh Muthukrishnan on 11/8/15.
//  Copyright © 2015 Srinivasan Sundaramoorthy. All rights reserved.
//

import UIKit

class NewPlanViewController: UIViewController {

    @IBOutlet weak var ChatImage: UIImageView!
    @IBOutlet weak var ChatName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
   
    @IBAction func Cancel(sender: AnyObject) {
    }
    @IBAction func createEvent(sender: AnyObject) {
        let date =  NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
        let request = NSMutableURLRequest(URL:NSURL(string: "https://web.njit.edu/~ss2773/newplan.php")!)
        request.HTTPMethod = "POST"
        let postString = "userid=4&groupstartdate='\(date)'&groupname='\(self.ChatName.text!)'"
        print(postString)
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request,completionHandler: {data,response, error ->
            Void in
            
            do{
                                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSArray
                //print(json)
                print(json!)
                
            }catch _ as NSError{
                print("error")
            }
            
            
            
        })
        task.resume()
        

        
        
    }

}
