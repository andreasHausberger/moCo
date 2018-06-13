//
//  SkillDataObject.swift
//  Therapy Helper
//
//  Created by Andreas on 21.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import Foundation

class SkillDataObject {
    var name: String
    var text: String
    var category: Int
    var creationDate: Date
    var timer: Int
    
    init(name: String, text: String, category: Int, creationDate: Date, timer: Int){
        self.name = name
        self.text = text
        self.category = category
        self.creationDate = creationDate
        self.timer = timer
    }
    
    
}
