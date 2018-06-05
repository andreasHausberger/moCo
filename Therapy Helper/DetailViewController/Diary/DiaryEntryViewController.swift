//
//  DiaryEntryViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 02.06.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class DiaryEntryViewController: DiaryFormViewController {
    
    private var entry: DiaryEntryDataObject?
    
    var previousVC: DiaryFormCollectionViewController?
    
    @IBOutlet weak var text: UITextField!
    
    @IBOutlet weak var angerLabel: UILabel!
    
    @IBOutlet weak var fatigueLabel: UILabel!
    
    @IBOutlet weak var worryLabel: UILabel!
    
    @IBOutlet weak var positiveLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        entry = DiaryEntryDataObject()
        entry?.emotion_anger = 5.0
        entry?.emotion_fatigue = 5.0
        entry?.emotion_worry = 5.0
        entry?.emotion_positive = 5.0
        
    }
    
    @IBAction func setAngerSlider(_ sender: UISlider) {
        if entry != nil {
            entry?.emotion_anger = setLabel(slider: sender, label: angerLabel)
        }
    }
    
    @IBAction func setFatigueSlider(_ sender: UISlider) {
        if entry != nil {
            entry?.emotion_fatigue = setLabel(slider: sender, label: fatigueLabel)
        }
    }
    
    @IBAction func setWorrySlider(_ sender: UISlider) {
        if entry != nil {
            entry?.emotion_worry = setLabel(slider: sender, label: worryLabel)
        }
    }
    
    @IBAction func setPositiveSlider(_ sender: UISlider) {
        if entry != nil {
            entry?.emotion_positive = setLabel(slider: sender, label: positiveLabel)
        }
    }
    
    
    private func setLabel(slider: UISlider, label: UILabel) -> Double {
        var currentValue = Double(slider.value)
        currentValue = Double(round(10*currentValue) / 10)
        label.text = String(currentValue)
        return currentValue
    }
    
    
    @IBAction func sendDiaryEntry(_ sender: Any) {
        if previousVC != nil {
            if let textString = text.text {
                entry?.text = textString
                previousVC?.addEntry(entry!)
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
}
