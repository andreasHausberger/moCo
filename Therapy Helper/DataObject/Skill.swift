//
//  Skill.swift
//  Therapy Helper
//
//  Created by Andreas on 01.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import Foundation
import UIKit

class Skill {
    
    let name: String
    let text: String
    let timer: Int
    let creationDate: Date
    let category: SkillCategory
    
    enum SkillCategory {
        case mental, physical, none
    }
    
    init(name: String, text: String, timer: Int, creationDate: Date, categoryNumber: Int) {
        self.name = name
        self.text = text
        self.timer = timer // 0 for untimed skill
        self.creationDate = creationDate
        
        switch categoryNumber {
        case 0:
            self.category = .mental
            return
        case 1:
            self.category = .physical
            return
        default:
            self.category = .none
        }
    }
    
    func displayText(short: Bool) -> String {
        //TODO: Shorten description text accordingly and append "..." after the last word
        return self.text
    }
}
