//
//  NoteRouter.swift
//  AlamofireDesign
//
//  Created by Phuong Nguyen on 1/25/17.
//  Copyright © 2017 Phuong Nguyen. All rights reserved.
//

import UIKit
import Alamofire

let notes = "/notes"

enum NoteRouter: AbstractURLRequestConvertible {
    
    case Read(offset: Int, limit: Int)
    
    var method: Alamofire.Method {
        switch self {
        case .Read:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .Read(_, _):
            return notes
        }
    }
    
    var URLRequest: NSMutableURLRequest {
        let mutableURLRequest = defaultURLRequest(self)
        
        return mutableURLRequest
    }
}