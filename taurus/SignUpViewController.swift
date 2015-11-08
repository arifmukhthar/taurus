//
//  SignUpViewController.swift
//  taurus
//
//  Created by user113255 on 11/7/15.
//  Copyright © 2015 Srinivasan Sundaramoorthy. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtUName: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    @IBOutlet weak var txtRetypePwd: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func signUpClicked(sender: AnyObject) {
        if txtEmail.text != "" && txtUName.text != "" && txtPwd.text != "" && txtRetypePwd.text != ""
        {
            if txtPwd.text != txtRetypePwd.text
            {
                let alert = UIAlertController(title: "Passwords Does not match", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else
            {
                insertUser(txtEmail.text!, uname: txtUName.text!, pwd: txtPwd.text!, url: "https://web.njit.edu/~rb454/signup1.php")
            }
        }
        else
        {
            let alert = UIAlertController(title: "Text Field Empty", message: "All text fields must be provided", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    func insertUser(email: String, uname: String, pwd: String, url: String)
    {
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "POST"
        
        let params = "email='\(email)'&uname='\(uname)'&pwd='\(pwd)'"
        print(params)
        request.HTTPBody = params.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task1 = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {error -> Void in
            print("error: \(error)")
        })
        
        task1.resume()
    }

}
