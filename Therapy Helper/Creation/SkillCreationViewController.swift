//
//  SkillCreationViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 23.06.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class SkillCreationViewController: UIViewController, UITextFieldDelegate {
    
    
    var parentVC: SkillsViewController?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var timerSwitch: UISwitch!
    
    @IBOutlet weak var timerPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.returnKeyType = .done
        nameTextField.delegate = self
        
        descriptionTextField.returnKeyType = .done
        descriptionTextField.delegate = self
        
    }
    
    
    @IBAction func createSkill(_ sender: Any) {
        guard nameTextField.text != "" else { showErrorMessage(); return }
        guard descriptionTextField.text != "" else { showErrorMessage(); return }
        
        

        let action = UIAlertController(title: "Category", message: "Select a category for the Skill", preferredStyle: .actionSheet)
        
        let physicalCat = UIAlertAction(title: "Physical", style: .default) { (_) in
            
            self.createSkillWith(category: 1)
        }
        
        let mentalCat = UIAlertAction(title: "Mental", style: .default) { (_) in
            
            self.createSkillWith(category: 2)
        }
        
        action.addAction(physicalCat)
        action.addAction(mentalCat)
        
        self.present(action, animated: true, completion: nil)
        
    }
    
    private func createSkillWith(category: Int) {
        let hasTimer = timerSwitch.isOn
        let timerValue = hasTimer ? (Int(timerPicker.countDownDuration) / 60) : 0
        let newSkill = SkillDataObject(name: self.nameTextField.text!, text: self.descriptionTextField.text!, category: category, creationDate: Date(), timer: timerValue)
        
        if self.parentVC != nil {
            self.parentVC!.addSkillFromCreationSheet(skill: newSkill)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    private func showErrorMessage() {
        let alert = UIAlertController(title: "Error", message: "Please enter a valid name and description for the Skill!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }

   

}
