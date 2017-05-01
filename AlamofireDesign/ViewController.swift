//
//  ViewController.swift
//  AlamofireDesign
//
//  Created by Phuong Nguyen on 1/25/17.
//  Copyright © 2017 Phuong Nguyen. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Alamofire.request(UserRouter.Read(userId: 1))
            .responseJSON { (response) in
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

