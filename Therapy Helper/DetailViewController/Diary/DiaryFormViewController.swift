//
//  DiaryFormViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 30.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class DiaryFormViewController: UIViewController {
    
    @IBOutlet weak var startTimePicker: UIDatePicker?
    
    @IBOutlet weak var endTimePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func submitMood(_ sender: Any) {
        if let parentVC = self.parent as? DiaryDetailViewController {
            parentVC.saveDiary()
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        if let parentVC = self.parent as? DiaryDetailViewController {
            guard startTimePicker != nil && endTimePicker != nil else { return }
            parentVC.startTime = startTimePicker!.date
            parentVC.endTime = endTimePicker!.date
        }
    }
    
    

}
