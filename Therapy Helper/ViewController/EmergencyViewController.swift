//
//  EmergencyViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 08.06.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class EmergencyViewController: UIViewController {
    
    var message: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addFirstMessage(_ sender: UIButton) {
        message += "Lorem Ipsum Dolor Sit Amet \n"
        
        }
    
    @IBAction func addSecondMessage(_ sender: UIButton) {
        message += "Sponte sua sine lege fidem rectumque \n"
    }
    
    @IBAction func addThirdMessage(_ sender: UIButton) {
        message += "Donde esta la biblioteca? \n"
    }
    
    
    @IBAction func sendMessage(_ sender: Any) {
        print(message)
        displayMessage()
    }
    
    private func displayMessage() {
        let alert = UIAlertController(title: "Message sent", message: "your Message was sent to your therapist.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Return", style: .cancel) {
            _ in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
