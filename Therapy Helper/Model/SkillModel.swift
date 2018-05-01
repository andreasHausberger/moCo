//
//  SkillModel.swift
//  Therapy Helper
//
//  Created by Andreas on 01.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import Foundation
import UIKit

class SkillModel {
    private var skills: [Skill] = [Skill]()
    
    func addSkill(skill: Skill) {
            skills.append(skill)
    }
    
    func getSkills() -> [Skill] {
        return skills
    }
}
