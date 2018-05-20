//
//  MoodCell.swift
//  Therapy Helper
//
//  Created by Andreas on 12.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class MoodCell: UICollectionViewCell {

    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var score: UILabel!
    
    func configure(moodDataObject: MoodDataObject) {
        if let date = moodDataObject.creationDate {
            self.date.text = date.description
        }
        else {
            self.date.text = Date().description
        }
        
        let overall = moodDataObject.overall
        guard overall <= 10.0 && overall >= 0 else { return }
        
        self.score.text = overall.description
        
        if (overall < 5.0) {
            self.backgroundColor = UIColor(displayP3Red: 0.89, green: 0.618, blue: 0.592, alpha: 1.0) // red

        }
        else if (overall < 7.0) {
            self.backgroundColor = UIColor(displayP3Red: 0.929, green: 1.0, blue: 0.420, alpha: 1.0) // yellow
        }
        else {
            self.backgroundColor = UIColor(displayP3Red: 0.509, green: 1.0, blue: 0.451, alpha: 1.0) // green
        }
        
    }
    
}

