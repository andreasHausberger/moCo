//
//  SkillCellCollectionViewCell.swift
//  Therapy Helper
//
//  Created by Andreas on 01.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class SkillCell: UICollectionViewCell {
    
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var text: UILabel!
    
    @IBOutlet weak var timer: UILabel!
    
    @IBOutlet weak var timerText: UILabel!
    
    func configureContent(_from skill: Skill) {
        name.text = skill.name
        text.text = skill.text
        
        if (skill.timer != 0) {
            timer.text = skill.timer
            timerText.text = "Timer"
        }
        else {
            timer.text = ""
            timerText.text = "Instant"
        }
        
        switch skill.category {
        case .mental:
            self.backgroundColor = UIColor(displayP3Red: 0.98, green: 0.78, blue: 0, alpha: 1)
            return
        case .physical:
            self.backgroundColor = UIColor(displayP3Red: 0.35, green: 0.78, blue: 0.98, alpha: 1)
            return
        case .none:
            self.backgroundColor = UIColor(displayP3Red: 0.60, green: 0.60, blue: 0.60, alpha: 1)
        }
    }
}
