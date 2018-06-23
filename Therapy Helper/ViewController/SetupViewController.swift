//
//  SetupViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 21.06.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {
    
    
    
    @IBOutlet weak var urlField: UITextField!
    
    
    @IBOutlet weak var connectButton: UIButton!
    
    @IBOutlet weak var offlineButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        connectButton.layer.cornerRadius = 10
        offlineButton.layer.cornerRadius = 10
    }
    
    @IBAction func tryConnection(_ sender: Any) {
        
        let fhirManager = FHIRManager.sharedInstance
        
        if urlField.text! != "" {
            if !fhirManager.tryGetConnection(urlString: urlField.text!) {
                displayErrorMessage()
            }
        }
        
    
    }
    
    private func displayErrorMessage() {
        let alert = UIAlertController(title: "Error!", message: "There was an error conencting to the server. Please use a different URL or use the app in Offline mode.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func useOfflineMode(_ sender: Any) {
        FHIRManager.isOffline = true
    }
    
    

 
}
