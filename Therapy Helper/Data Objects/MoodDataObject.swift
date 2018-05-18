//
//  MoodDataObject.swift
//  Therapy Helper
//
//  Created by Andreas on 12.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import Foundation

class MoodDataObject {
    var mental_wellbeing: Double
    var physical_wellbeing: Double
    var optimism: Double
    var overall: Double
    var text: String
    var creationDate: Date?
    
    init(mental_wellbeing: Double, physical_wellbeing: Double, optimism: Double, text: String) {
        self.mental_wellbeing = mental_wellbeing
        self.physical_wellbeing = physical_wellbeing
        self.optimism = optimism
        self.text = text
        self.overall = (mental_wellbeing + physical_wellbeing + optimism) / 3
    }
    
}
