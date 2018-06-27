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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func createChallenge(_ sender: Any) {
        guard nameTextField.text != "" else { showErrorMessage(); return }
        guard descriptionTextField.text != "" else { showErrorMessage(); return }
        guard currentGoal > 0 else { showErrorMessage(); return}
        
        let newChallenge = ChallengeDataObject(title: self.nameTextField.text!, text: self.descriptionTextField.text!, counterTotal: Int64(currentGoal), counterCurrent: 0, creationDate: Date())
        
            self.parentVC!.addChallengeFromCreationSheet(challenge: newChallenge)
            self.dismiss(animated: true, completion: nil)
        
    }

    @IBAction func changeGoal(_ sender: UIStepper) {
        currentGoal = Int(sender.value)
        self.goalDisplayLabel.text = currentGoal.description
        
    }
    
    private func showErrorMessage() {
        let alert = UIAlertController(title: "Error", message: "Please enter a valid name and description for the Challenge, and set the goal to a minimum of 1!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true)
        
    }
    
}





















