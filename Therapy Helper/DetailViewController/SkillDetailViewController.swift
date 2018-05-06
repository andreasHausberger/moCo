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
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.titleLabel.text = skill!.name
        self.descriptionLabel.text = skill!.text
        self.dateLabel.text = skill!.creationDate?.description
    }
    
    func setUp(skill: Skill) {
        self.skill = skill

    }
    

}
