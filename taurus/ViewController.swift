//
//  ViewController.swift
//  taurus
//
//  Created by Venkatesh Muthukrishnan on 11/7/15.
//  Copyright © 2015 Srinivasan Sundaramoorthy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var loginSuccess = Bool()
    @IBOutlet weak var txtUname: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    var user = String()
    @IBAction func checkUserPass(sender: UIButton) {
        getJson("https://web.njit.edu/~rb454/login.php")
                if loginSuccess
        {
            print("Login Success")
            performSegueWithIdentifier("NextScreen", sender: nil)
            
           /* let alert = UIAlertController(title: "User Name or Password is wrong", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)*/
        }
    }
    @IBAction func txtValueChanged(sender: AnyObject) {
       // getJson("https://web.njit.edu/~rb454/login.php")
        user = txtUname.text!
        print("from txtValue Chaanged: \(user)")
        

        print("Value Changed")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func getJson(url: String)
    {
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "POST"
        let params = "uname='\(user)'"
        print(params)
        request.HTTPBody = params.dataUsingEncoding(NSUTF8StringEncoding)
        let task1 = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {data,response, error -> Void in
            print("data: \(data)")
            
            do{
                var i = 0
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSArray
                print("data fetching")
                print(json)
                for _ in json! {
                    let dd = json![i]
                    let uname = dd["UserName"] as! String
                    let pwd = dd["UserPwd"] as! String
                    print("un: \(uname) pwd:\(pwd)")
                   if self.txtUname.text == uname && self.txtPwd.text == pwd
                   {
                        self.loginSuccess = true
                    }
                    i++
                    
                }
                dispatch_async(dispatch_get_main_queue(), {
                    
                });

            }catch _ as NSError{
                
            }
        })
        task1.resume()


    }
    
    
    
    }

