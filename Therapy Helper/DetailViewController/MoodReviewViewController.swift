//
//  MoodReviewViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 21.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class MoodReviewViewController: UIViewController {
    
    var moodDataObject: MoodDataObject?
    
    var color: UIColor?
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var mentalScore: UILabel!
    
    @IBOutlet weak var physicalScore: UILabel!
    
    @IBOutlet weak var optimismScore: UILabel!
    
    @IBOutlet weak var overallScore: UILabel!
    
    @IBOutlet weak var text: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        if self.color != nil {
            self.backgroundView.backgroundColor = color
        }
        self.backgroundView.layer.cornerRadius = 10
    }
    
    private func setup() {
        if let mdo = moodDataObject {
            self.mentalScore.text = mdo.mental_wellbeing.description
            self.physicalScore.text = mdo.physical_wellbeing.description
            self.optimismScore.text = mdo.optimism.description
            self.overallScore.text = mdo.overall.description
            self.text.text = mdo.text
            self.date.text = mdo.creationDate?.description
        }
    }

}
