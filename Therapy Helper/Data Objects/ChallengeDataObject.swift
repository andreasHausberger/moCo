//
//  ChallengeDataObject.swift
//  Therapy Helper
//
//  Created by Josef Glas on 24.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import Foundation

class ChallengeDataObject {
    var title: String
    var text: String
    var counterTotal: Int64
    var counterCurrent: Int64
    var creationDate: Date
    
    init(title: String, text: String, counterTotal: Int64, counterCurrent: Int64, creationDate: Date){
        self.title = title
        self.text = text
        self.counterTotal = counterTotal
        self.counterCurrent = counterCurrent
        self.creationDate = creationDate
    }
    
}
