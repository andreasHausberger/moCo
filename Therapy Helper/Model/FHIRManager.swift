//
//  FHIRManager.swift
//  Therapy Helper
//
//  Created by Andreas on 20.06.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import Foundation
import SMART

class FHIRManager: NSObject {
    
    static var sharedInstance = FHIRManager()
    
    func tryGetConnection(urlString: String) {
        
        let nsURL = NSURL(string: urlString)!
        let settings = OAuth2JSON()
        
        let client = Client(baseURL: nsURL as URL, settings: settings)
        
        client.authorize { (patient, error) in
            if patient != nil {
                print("success")
            }
            else {
                print("failure")
            }
        }
        
    }
    
}
