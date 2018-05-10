//
//  SkillDetailViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 06.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class SkillDetailViewController: UIViewController {
    
    var skill: Skill?
    
    var backgroundColor: UIColor?
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.titleLabel.text = skill!.name
        self.descriptionLabel.text = skill!.text
        self.dateLabel.text = skill!.creationDate?.description
        
        self.backgroundView.layer.cornerRadius = 20
        self.backgroundView.backgroundColor = self.backgroundColor
    }
    
    func setUp(skill: Skill) {
        self.skill = skill
        
        switch skill.category {
        case 1:
            self.backgroundColor = UIColor(displayP3Red: 0.98, green: 0.78, blue: 0, alpha: 0.75)
            return
        case 2:
            self.backgroundColor = UIColor(displayP3Red: 0.35, green: 0.78, blue: 0.98, alpha: 0.75)
            return
        case 0:
            self.backgroundColor = UIColor(displayP3Red: 0.60, green: 0.60, blue: 0.60, alpha: 0.75)
        default:
            self.backgroundColor = UIColor(displayP3Red: 0.60, green: 0.60, blue: 0.60, alpha: 0.75)
            
        }
        

    }
    

}
