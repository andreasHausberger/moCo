//
//  ChallengeCreationViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 23.06.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class ChallengeCreationViewController: UIViewController, UITextFieldDelegate {
    
    
    var parentVC: ChallengesViewController?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var goalDisplayLabel: UILabel!
    
    var currentGoal: Int = 0
    
    @IBOutlet weak var createButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.returnKeyType = .done
        nameTextField.delegate = self
        
        descriptionTextField.returnKeyType = .done
        descriptionTextField.delegate = self
        
        self.createButton.layer.cornerRadius = 10
        
    }
    
    
    
    
    
    @IBAction func createChallenge(_ sender: Any) {
        guard nameTextField.text != "" else { showErrorMessage(); return }
        guard descriptionTextField.text != "" else { showErrorMessage(); return }
        
        let newChallenge = ChallengeDataObject(title: self.nameTextField.text!, text: self.descriptionTextField.text!, counterTotal: Int64((self.goalDisplayLabel.text! as NSString).integerValue), counterCurrent: 0, creationDate: Date())
        
      
            self.parentVC!.addChallengeFromCreationSheet(challenge: newChallenge)
            self.dismiss(animated: true, completion: nil)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
      
        
        
        
       
        
        
    }

    @IBAction func changeGoal(_ sender: UIStepper) {
        self.goalDisplayLabel.text = Int(sender.value).description
    }
    
}








private func showErrorMessage() {
    let alert = UIAlertController(title: "Error", message: "Please enter a valid name and description for the Challenge!", preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    
   
    
    
}












