//
//  Skill.swift
//  Therapy Helper
//
//  Created by Andreas on 01.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import Foundation
import UIKit

class SkillTemp: Codable {
    
    let name: String
    let text: String
    let timer: Int
    let creationDate: Date
    let category: SkillCategory
    
    enum SkillCategory {
        case none, mental, physical
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case text
        case timer
        case creationDate
        case category
    }
    
    required init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        self.name = try values!.decode(String.self, forKey: .name)
        self.text = try values!.decode(String.self, forKey: .text)
        self.timer = try values!.decode(Int.self, forKey: .timer)
        self.creationDate = try values!.decode(Date.self, forKey: .creationDate)
        let categoryNumber = try values!.decode(Int.self, forKey: .category)
        
        switch categoryNumber {
        case 0:
            self.category = .none
            return
        case 1:
            self.category = .mental
            return
        case 2:
            self.category = .physical
            return
        default:
            self.category = .none
            return
        }
        
    }
    
    init(name: String, text: String, timer: Int, creationDate: Date, categoryNumber: Int) {
        self.name = name
        self.text = text
        self.timer = timer // 0 for untimed skill
        self.creationDate = creationDate
        
        switch categoryNumber {
        case 0:
            self.category = .none
            return
        case 1:
            self.category = .mental
            return
        case 2:
            self.category = .physical
        default:
            self.category = .physical
        }
    }
    
    func displayText(short: Bool) -> String {
        //TODO: Shorten description text accordingly and append "..." after the last word
        return text
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(text, forKey: .text)
        try container.encode(timer, forKey: .timer)
        try container.encode(creationDate, forKey: .creationDate)
        let categoryNumber = self.category == .mental ? 1 : self.category == .physical ? 2 : 0
        try container.encode(categoryNumber, forKey: .category)
    }
    
}
