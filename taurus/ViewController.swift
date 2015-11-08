//
//  ViewController.swift
//  taurus
//
//  Created by Venkatesh Muthukrishnan on 11/7/15.
//  Copyright © 2015 Srinivasan Sundaramoorthy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var loginSuccess = false
    @IBOutlet weak var txtUname: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    @IBAction func checkUserPass(sender: AnyObject) {
        getJson("https://web.njit.edu/~rb454/login.php",uname: txtUname.text!)
        if !loginSuccess
        {
            let alert = UIAlertController(title: "User Name or Password is wrong", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func getJson(url: String,uname: String)
    {
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "POST"
        
        let params = "email='\(uname)''"
        print(params)
        request.HTTPBody = params.dataUsingEncoding(NSUTF8StringEncoding)
        let task1 = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {data,response, error -> Void in
            print("data: \(data)")
            
            do{
                var i = 0
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSArray
                //print(json)
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

                print(json)
            }catch _ as NSError{
                
            }
        })
        task1.resume()


    }
    
    }

