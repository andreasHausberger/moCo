//
//  SkillCellCollectionViewCell.swift
//  Therapy Helper
//
//  Created by Andreas on 01.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit
import CoreData

class SkillCell: UICollectionViewCell {
    
    var skill: SkillDataObject?
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var text: UILabel!
    
    @IBOutlet weak var timer: UILabel!
    
    @IBOutlet weak var timerText: UILabel!
    
    func configureContent(from skill: SkillDataObject) {
        self.skill = skill
        name.text = skill.name
        text.text = skill.text
        
        if (skill.timer != 0) {
            timer.text = skill.timer.description
            timerText.text = "Timer"
        }
        else {
            timer.text = ""
            timerText.text = "Instant"
        }
        
        switch skill.category {
        case 1:
            self.backgroundColor = UIColor(displayP3Red: 0.98, green: 0.78, blue: 0, alpha: 1)
            return
        case 2:
            self.backgroundColor = UIColor(displayP3Red: 0.35, green: 0.78, blue: 0.98, alpha: 1)
            return
        case 0:
            self.backgroundColor = UIColor(displayP3Red: 0.60, green: 0.60, blue: 0.60, alpha: 1)
        default:
            self.backgroundColor = UIColor(displayP3Red: 0.60, green: 0.60, blue: 0.60, alpha: 1)

        }
    }
}
