//
//  MoodFormViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 12.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class MoodFormViewController: UIViewController {
    
    let rootVC: MoodDetailViewController? = nil
    
    @IBOutlet weak var physicalLabel: UILabel?
    
    @IBOutlet weak var mentalLabel: UILabel?
    
    @IBOutlet weak var optimismLabel: UILabel?
    
    @IBOutlet weak var moodTextField: UITextField!
    
    
    @IBOutlet weak var backgroundView1: UIView?
    
    @IBOutlet weak var backgroundView2: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if backgroundView1 != nil {
            backgroundView1?.layer.cornerRadius = 10
        }
        if backgroundView2 != nil {
            backgroundView2?.layer.cornerRadius = 10
        }
    }
    
    @IBAction func setPhysicalSlider(_ sender: UISlider) {
        if physicalLabel != nil {
            if let parentVC = self.parent as? MoodDetailViewController {
                parentVC.physicalScore = setLabel(slider: sender, label: physicalLabel!)
            }
        }
    }
    
    @IBAction func setMentalSlider(_ sender: UISlider) {
        if mentalLabel != nil {
            if let parentVC = self.parent as? MoodDetailViewController {
                 parentVC.mentalScore =  setLabel(slider: sender, label: mentalLabel!)
            }
        }
    }
    
    
    @IBAction func setOptimismSlider(_ sender: UISlider) {
        if optimismLabel != nil {
            if let parentVC = self.parent as? MoodDetailViewController {
                parentVC.optimismScore = setLabel(slider: sender, label: optimismLabel!)
            }
        }
    }
    
    
    @IBAction func submitMood(_ sender: Any) {

        if self.moodTextField.text == nil {
            self.moodTextField.text = ""
        }
        let text = self.moodTextField.text!
        if let parentVC = self.parent as? MoodDetailViewController {
            parentVC.text = text
            parentVC.createMood()
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
   

    private func setLabel(slider: UISlider, label: UILabel) -> Double {
        var currentValue = Double(slider.value)
        currentValue = Double(round(10*currentValue) / 10)
        label.text = String(currentValue)
        return currentValue
    }

}
