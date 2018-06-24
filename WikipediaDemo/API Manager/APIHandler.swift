//
//  ViewController.swift
//  WikipediaDemo

//  Created by Agarwal, JitendraKumar on 6/24/18.
//  Copyright © 2018 Agarwal, JitendraKumar. All rights reserved.
//


import UIKit
import SwiftyJSON
class APIHandler: NSObject {
    static let handler = APIHandler()
    fileprivate override init() { }
    
    
    
    
    // MARK:- Search
    func getWikiSearchResult(searchKey: String?, success: @escaping (_ response: JSON?) -> (), failure: @escaping (_ error: NSError?) -> ()) {
        
        APIManager.manager.getRequest(searchKey!, headers: nil, parameters: nil, success: { (response) in
           success(response)
           
        }) { (error) in
             showToastWith(message: "Something Wrong!")
            failure(error)
        }
    
    
    }

    
}
