//
//  ViewController.swift
//  WikipediaDemo 

//  Created by Agarwal, JitendraKumar on 6/24/18.
//  Copyright © 2018 Agarwal, JitendraKumar. All rights reserved.
//




import UIKit
import Alamofire
import SKActivityIndicatorView
import SwiftyJSON

class APIManager: Alamofire.SessionManager {

	static let manager: APIManager = {
		//let configuration = Timberjack.defaultSessionConfiguration()
        let manager = APIManager(configuration:  URLSessionConfiguration.default)
    
		return manager
	}()

	fileprivate let baseURL = "https://en.wikipedia.org//w/api.php?action=query&format=json&prop=pageimages%7Cpageterms&generator=prefixsearch&redirects=1&formatversion=2&piprop=thumbnail&pithumbsize=50&wbptterms=description&gpssearch="
    
  
	fileprivate static let apiKey = ""
    private let parameterEncoding: ParameterEncoding = JSONEncoding() as ParameterEncoding
	internal var header: [String: String] = ["Content-Type": "application/json"]

	func cancelAllTaskExcluding(tasks cancelTasks: [String]) {
		self.session.getTasksWithCompletionHandler
		{
			(dataTasks, uploadTasks, downloadTasks) -> Void in
			for task in dataTasks as [URLSessionTask] {
				if !cancelTasks.contains((task.currentRequest?.url?.description)!) {
					task.cancel()
				}
			}
		}
	}

    
	// MARK: Reachability Check
	 func isReachable() -> (Bool) {
        
		let network = NetworkReachabilityManager()
		network?.startListening()
        
		if network?.isReachable ?? false {
			if ((network?.isReachableOnEthernetOrWiFi) != nil) {
				return true
			} else if (network?.isReachableOnWWAN)! {
                //self.moveToNetWorkConnectionsVC()
				return true
			}
		}
		else {
            // self.moveToNetWorkConnectionsVC()
			return false
		}
		return false
	}
// MARK:- No Reachable View Controller 
    
   
	
	func getRequest(_ endpoint: String,  headers: [String: String]?, parameters: [String: AnyObject]?, success: @escaping (_ response: JSON?) -> (), failure: @escaping (_ error: NSError?) -> ()) {

		defer {

		}

		if headers != nil {
			header += headers!
		}
		if isReachable() {

			APIManager.manager.cancelAllTaskExcluding(tasks: [baseURL])

			SKActivityIndicator.show()
		
            
            print(baseURL + endpoint)
            APIManager.manager.request(String(baseURL + endpoint),method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON { response in
        
				SKActivityIndicator.dismiss()
				guard response.result.isSuccess else {
                    if response.result.error!._code == NSURLErrorTimedOut {
                        
                        //timeout here
                       // Toast.show(withMessage: REQUEST_TIME_OUT)
                    }
					failure(response.result.error as NSError?)
					return
				}

				if let value = response.result.value {
					success(JSON(value))
				}
			}
		} else {
		SKActivityIndicator.dismiss()
		//	Toast.show(withMessage: NO_NETWORK)
		}
	}


    

}

func += <K, V> (left: inout [K: V], right: [K: V]) {
	for (k, v) in right {
		left.updateValue(v, forKey: k)
	}
}
