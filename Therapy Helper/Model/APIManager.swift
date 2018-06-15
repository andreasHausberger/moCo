//
//  APIManager.swift
//  Therapy Helper
//
//  Created by Andreas on 13.06.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit
import SwiftyJSON
import FHIR

class APIManager: NSObject {
    
    static var baseURL = "https://jsonplaceholder.typicode.com"
    static let sharedInstance = APIManager()
    static var postsEndPoint = "/posts/"

    func getPostWithId(postId: Int, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void) {
        let url: String = APIManager.baseURL + APIManager.postsEndPoint + String(postId)
        let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error != nil) {
                onFailure(error!)
            }
            else {
                let result = JSON(data!)
                onSuccess(result)
            }
        }
        task.resume()
    }
    
    
    
    func setUpConnection(URL: String, endpoint: String) -> String {
        APIManager.baseURL = URL
        APIManager.postsEndPoint = endpoint
                
        return APIManager.baseURL + APIManager.postsEndPoint
        
    }
    

}
