//
//  NoteViewController.swift
//  AlamofireDesign
//
//  Created by Phuong Nguyen on 1/25/17.
//  Copyright © 2017 Phuong Nguyen. All rights reserved.
//

import UIKit
import Alamofire

class NoteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        Alamofire.request(NoteRouter.Read(offset: 0, limit: 10))
            .responseJSON { (response) in
                switch response.result {
                case .Success(let value):
                    print(value)
                case .Failure(let error):
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
