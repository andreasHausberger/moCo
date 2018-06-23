//
//  ChallengeCreationViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 23.06.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class ChallengeCreationViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var goalDisplayLabel: UILabel!
    
    var currentGoal: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func changeGoal(_ sender: UIStepper) {
        self.goalDisplayLabel.text = Int(sender.value).description
    }
    
}
