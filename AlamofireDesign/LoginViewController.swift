//
//  LoginViewController.swift
//  AlamofireDesign
//
//  Created by Phuong Nguyen on 1/25/17.
//  Copyright © 2017 Phuong Nguyen. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let email = "phuongnl.hn@gmail.com"
        let password = "123456"
        
        Alamofire.request(UserRouter.LoginUser(parameters: ["email": email, "password": password]))
            .responseJSON { (response) in
                switch response.result {
                case .Success(let value):
                    // Handler Login Success
                    print(value)
                case .Failure(let error):
                    // Handler Login Failure
                    print(error)
                }
        }

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

}
