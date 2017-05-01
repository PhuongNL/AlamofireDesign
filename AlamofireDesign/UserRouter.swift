//
//  APIHelper.swift
//  AlamofireDesign
//
//  Created by Phuong Nguyen on 1/25/17.
//  Copyright © 2017 Phuong Nguyen. All rights reserved.
//

import UIKit
import Alamofire

let baseURLString = "http://localhost:3000/api"
let users = "/users"

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
            debugPrint(self)
        #endif
        return self
    }
}

protocol AbstractURLRequestConvertible: URLRequestConvertible {
    var method: Alamofire.Method { get }
    var path: String { get }
}

func defaultURLRequest(router: AbstractURLRequestConvertible) -> NSMutableURLRequest {
    let URL = NSURL(string: baseURLString)!
    let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(router.path))
    mutableURLRequest.HTTPMethod = router.method.rawValue
    
    if let token = UserRouter.authToken {
        mutableURLRequest.setValue(token, forHTTPHeaderField: "Authorization")
    }
    
    return mutableURLRequest
}

enum UserRouter: AbstractURLRequestConvertible {
    
    // Variables
    static var authToken: String?
    
    // Action
    case Create(parameters: [String: AnyObject])
    case Read(userId: Int)
    case Update(userId: Int, parameters: [String: AnyObject])
    case Delete(userId: String)
    case LoginUser(parameters: [String: AnyObject])
    
    // Method
    var method: Alamofire.Method {
        switch self {
        case .Create:
            return .POST
        case .Read:
            return .GET
        case .Update:
            return .PUT
        case .Delete:
            return .DELETE
        case .LoginUser:
            return .POST
        }
    }
    
    // Path
    var path: String {
        switch self {
        case .Create:
            return users
        case .Read(let userId):
            return "\(users)/\(userId)"
        case .Update(let userId, _):
            return "\(users)/\(userId)"
        case .Delete(let userId):
            return "\(users)/\(userId)"
        case.LoginUser(_):
            return "\(users)/login"
        }
    }
    
    // Request
    var URLRequest: NSMutableURLRequest {
        
        let mutableURLRequest = defaultURLRequest(self)
        
        switch self {
        case .Create(let parameters):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters).0
        case .Update(_, let parameters):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters).0
        case .LoginUser(let parameters):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters).0
        default:
            return mutableURLRequest
        }
    }
    
}
