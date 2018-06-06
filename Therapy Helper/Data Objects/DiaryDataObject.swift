//
//  DiaryDataObject.swift
//  Therapy Helper
//
//  Created by Andreas on 28.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import Foundation

class DiaryDataObject {
    
    var score: Double?
    var morningActivities: [DiaryEntryDataObject] = [DiaryEntryDataObject]()
    
    var afternoonActivities: [DiaryEntryDataObject] = [DiaryEntryDataObject]()
    
    var eveningActivities: [DiaryEntryDataObject] = [DiaryEntryDataObject]()
    
    var startTime: Date
    
    var endTime: Date
    
    let patientID: Int
    
    init(startTime: Date, endTime: Date, patientID: Int) {
        self.startTime = startTime
        self.endTime = endTime
        self.patientID = patientID
    }
}
