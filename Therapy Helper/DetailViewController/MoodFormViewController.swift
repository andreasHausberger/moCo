//
//  MoodFormViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 12.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class MoodFormViewController: UIViewController {
    
    
    @IBOutlet weak var physicalLabel: UILabel?
    
    @IBOutlet weak var mentalLabel: UILabel?
    
    @IBOutlet weak var optimismLabel: UILabel?
    
    @IBOutlet weak var moodTextField: UITextField!
    
    
    
    @IBAction func setPhysicalSlider(_ sender: UISlider) {
        if physicalLabel != nil {
            setLabel(slider: sender, label: physicalLabel!)
        }
            
    }
    
    @IBAction func setMentalSlider(_ sender: UISlider) {
        if mentalLabel != nil {
            setLabel(slider: sender, label: mentalLabel!)
        }
    }
    
    
    @IBAction func setOptimismSlider(_ sender: UISlider) {
        if optimismLabel != nil {
            setLabel(slider: sender, label: optimismLabel!)
        }
    }
    
    
    @IBAction func submitMood(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    private func setLabel(slider: UISlider, label: UILabel) {
        var currentValue = Double(slider.value)
        currentValue = Double(round(10*currentValue) / 10)
        label.text = String(currentValue)
    }

}
