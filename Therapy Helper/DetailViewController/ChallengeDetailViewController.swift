//
//  ChallengeDetailViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 15.06.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class ChallengeDetailViewController: UIViewController {
    
    var challenge: ChallengeDataObject?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setUp(challenge: ChallengeDataObject) {
        self.challenge = challenge
        
        
    }
    
    
    @IBAction func addToCounter(_ sender: Any) {
    }
    
    
    @IBAction func removeFromCounter(_ sender: Any) {
    }
    
}
