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
    static var isOffline: Bool? // toggles offline mode
    
    //returns true if connection is established and data can be loaded.
    func tryGetConnection(urlString: String) -> Bool {
        var returnBool: Bool = false
        var variableURL = urlString
        if variableURL.last != "/" { variableURL.append("/") }
        
        let nsURL = NSURL(string: variableURL)!
        let settings: OAuth2JSON = ["redirect" : "smartapp://callback" ]
        
        let client = Client(baseURL: nsURL as URL, settings: settings)
        
        client.authorize { (patient, error) in
            if patient == nil || error != nil {
                print("failure: " + error!.localizedDescription)
                FHIRManager.isOffline = true
            }
            else {
                if patient != nil {
                    print(patient.debugDescription)
                    FHIRManager.isOffline = true
                    returnBool = true
                }
            }
           
        }
        
        client.getJSON(at: "Patient/") { (response) in
            print(response.debugDescription)
            returnBool = true
        }
         return returnBool
    }
    
}
